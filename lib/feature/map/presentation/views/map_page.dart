import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/resource/gen/assets.gen.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const String _naverMapClientIdFromEnv = String.fromEnvironment(
    'NAVER_MAP_CLIENT_ID',
  );
  static const NLatLng _seoulCityHall = NLatLng(37.5666, 126.979);
  late final Future<NLatLng?> _currentLocationFuture;

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
    return NLatLng(position.latitude, position.longitude);
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
        final showMyLocationMarker = currentLocation != null;
        final brightness = MediaQuery.of(context).platformBrightness;
        final isDarkMode = brightness == Brightness.dark;
        const flowerIcon = NOverlayImage.fromAssetImage('assets/icons/ic_garden_marker.png');
        // 2. 테스트 좌표를 이용한 마커 리스트 생성
        final List<NMarker> flowerMarkers = [
          NMarker(
            id: 'shop_1',
            position: const NLatLng(37.5235067, 126.8948802), // 밀리 플라워 카페
            icon: flowerIcon, // 커스텀 이미지 적용
            caption: const NOverlayCaption(text: "밀리 플라워 카페"),
          ),
          NMarker(
            id: 'shop_2',
            position: const NLatLng(37.5204516, 126.902863), // 꽃과생활
            icon: flowerIcon,
            caption: const NOverlayCaption(text: "꽃과생활"),
            captionAligns: [NAlign.bottom], // 캡션 위치 조절 (기본값)
          ),
          NMarker(
            id: 'shop_3',
            position: const NLatLng(37.5194301, 126.8884242), // 권문정플라워
            icon: flowerIcon,
            caption: const NOverlayCaption(text: "권문정플라워"),
          ),
        ];

        return NaverMap(
          options: NaverMapViewOptions(
            initialCameraPosition: NCameraPosition(
              target: initialTarget,
              zoom: 15,
            ),
            nightModeEnable: isDarkMode,
            locationButtonEnable: true,
            indoorEnable: true,
          ),
          onMapReady: (controller) {
            // 지도에 마커 추가
            controller.addOverlayAll(flowerMarkers.toSet());

            controller.setLocationTrackingMode(NLocationTrackingMode.follow);
          },
        );
      },
    );
  }
}
