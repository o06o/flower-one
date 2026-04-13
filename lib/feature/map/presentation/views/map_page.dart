import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const String _naverMapClientIdFromEnv = String.fromEnvironment(
    'NAVER_MAP_CLIENT_ID',
  );
  static const String _kakaoRestKeyFromEnv = String.fromEnvironment(
    'KAKAO_REST_KEY',
  );
  static const double _searchMoveThresholdMeters = 700;
  static const NLatLng _seoulCityHall = NLatLng(37.5666, 126.979);
  late final Future<NLatLng?> _currentLocationFuture;
  NaverMapController? _mapController;
  NLatLng? _lastKnownMyLocation;
  NLatLng? _lastSearchedCenter;
  NLatLng? _pendingSearchCenter;
  bool _isSearching = false;
  bool _isFirstCameraIdle = true;
  bool _ignoreNextIdleSearch = false;
  bool _isMovingToMyLocation = false;

  @override
  void initState() {
    super.initState();
    _currentLocationFuture = _resolveCurrentLocation();
  }

  Future<NLatLng?> _resolveCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return null;
    }

    final position = await Geolocator.getCurrentPosition();
    final location = NLatLng(position.latitude, position.longitude);
    _lastKnownMyLocation = location;
    return location;
  }

  Future<List<_KakaoPlace>> _fetchNearbyFlowerShops({
    required NLatLng center,
  }) async {
    final restKey = _kakaoRestKeyFromEnv.trim();
    if (restKey.isEmpty) return const [];

    final uri = Uri.https(
      'dapi.kakao.com',
      '/v2/local/search/keyword.json',
      {
        'query': '꽃집',
        'y': center.latitude.toString(),
        'x': center.longitude.toString(),
        'radius': '20000',
        'size': '5',
      },
    );

    final response = await http.get(
      uri,
      headers: {'Authorization': 'KakaoAK $restKey'},
    );

    if (response.statusCode != 200) {
      debugPrint('Kakao local API failed: ${response.statusCode} ${response.body}');
      return const [];
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map) return const [];
    final documents = decoded['documents'];
    if (documents is! List) return const [];

    return documents.map<_KakaoPlace?>((item) {
      if (item is! Map) return null;
      final placeName = item['place_name'];
      final x = item['x'];
      final y = item['y'];
      final name = placeName is String ? placeName.trim() : '';
      final lng = double.tryParse(x?.toString() ?? '');
      final lat = double.tryParse(y?.toString() ?? '');
      if (name.isEmpty || lat == null || lng == null) return null;
      return _KakaoPlace(name: name, position: NLatLng(lat, lng));
    }).whereType<_KakaoPlace>().toList();
  }

  bool _shouldSearchByDistance(NLatLng center) {
    final last = _lastSearchedCenter;
    if (last == null) return true;
    final distance = Geolocator.distanceBetween(
      last.latitude,
      last.longitude,
      center.latitude,
      center.longitude,
    );
    return distance >= _searchMoveThresholdMeters;
  }

  Future<void> _enqueueSearch(
    NLatLng center, {
    bool force = false,
  }) async {
    if (!force && !_shouldSearchByDistance(center)) return;
    _pendingSearchCenter = center;

    if (_isSearching) return;
    while (_pendingSearchCenter != null) {
      final target = _pendingSearchCenter!;
      _pendingSearchCenter = null;
      _isSearching = true;
      try {
        await _runSearch(target);
        _lastSearchedCenter = target;
      } finally {
        _isSearching = false;
      }
    }
  }

  Future<void> _runSearch(NLatLng center) async {
    final controller = _mapController;
    if (controller == null) return;

    final places = await _fetchNearbyFlowerShops(center: center);
    const flowerIcon = NOverlayImage.fromAssetImage(
      'assets/icons/ic_map_marker.png'
    );

    final Set<NMarker> markers = {
      for (var i = 0; i < places.length; i++)
        NMarker(
          id: 'shop_${i + 1}',
          position: places[i].position,
          icon: flowerIcon,
          caption: NOverlayCaption(text: places[i].name),
          captionAligns: const [NAlign.bottom],
          size: Size(56, 56),
        ),
    };

    await controller.clearOverlays(type: NOverlayType.marker);
    if (markers.isNotEmpty) {
      await controller.addOverlayAll(markers);
    }
  }

  Future<void> _moveToMyLocationAndSearch() async {
    if (_isMovingToMyLocation) return;
    final controller = _mapController;
    if (controller == null) return;

    setState(() => _isMovingToMyLocation = true);
    try {
      final location = await _resolveCurrentLocation();
      if (location == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('위치 권한이 필요해요.')),
        );
        return;
      }

      final update = NCameraUpdate.scrollAndZoomTo(target: location, zoom: 15);
      update.setAnimation(duration: const Duration(milliseconds: 600));
      _ignoreNextIdleSearch = true;
      await controller.updateCamera(update);
      await _enqueueSearch(location, force: true);
    } finally {
      if (mounted) {
        setState(() => _isMovingToMyLocation = false);
      }
    }
  }

  Future<void> _handleCameraIdle() async {
    if (_isFirstCameraIdle) {
      _isFirstCameraIdle = false;
      return;
    }
    if (_ignoreNextIdleSearch) {
      _ignoreNextIdleSearch = false;
      return;
    }
    final controller = _mapController;
    if (controller == null) return;

    final cameraPosition = await controller.getCameraPosition();
    await _enqueueSearch(cameraPosition.target);
  }

  @override
  Widget build(BuildContext context) {
    if (_naverMapClientIdFromEnv.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'NAVER_MAP_CLIENT_ID를 설정하면 지도를 볼 수 있어요.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return FutureBuilder<NLatLng?>(
      future: _currentLocationFuture,
      builder: (context, snapshot) {
        final currentLocation = snapshot.data;
        final initialTarget = currentLocation ?? _seoulCityHall;
        final brightness = MediaQuery.of(context).platformBrightness;
        final isDarkMode = brightness == Brightness.dark;
        return Stack(
          children: [
            NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: initialTarget,
                  zoom: 15,
                ),
                nightModeEnable: isDarkMode,
                locationButtonEnable: false,
                indoorEnable: true,
              ),
              onMapReady: (controller) async {
                _mapController = controller;
                _lastKnownMyLocation = currentLocation;
                controller.setLocationTrackingMode(NLocationTrackingMode.follow);
              },
              onCameraIdle: () {
                _handleCameraIdle();
              },
            ),
            Positioned(
              right: 16,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: 'move_to_my_location',
                mini: true,
                onPressed: _isMovingToMyLocation ? null : _moveToMyLocationAndSearch,
                child: _isMovingToMyLocation
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.my_location),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _KakaoPlace {
  final String name;
  final NLatLng position;

  const _KakaoPlace({
    required this.name,
    required this.position,
  });
}
