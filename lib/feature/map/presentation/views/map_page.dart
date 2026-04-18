import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flowerone/core/designsystem/toast/toast_extension.dart';
import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:flowerone/core/utils/error/ui_error_handler.dart';
import 'package:flowerone/core/utils/url/url_launcher_util.dart';
import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../viewmodel/map_view_model.dart';
import 'components/place_info_card.dart';

class MapPage extends HookConsumerWidget {
  static const String _naverMapClientIdFromEnv = String.fromEnvironment('NAVER_MAP_CLIENT_ID');
  static const NLatLng _seoulCityHall = NLatLng(37.5666, 126.979);

  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(mapViewModelProvider.notifier);
    final state = ref.watch(mapViewModelProvider);
    
    final mapController = useState<NaverMapController?>(null);
    final isFirstCameraIdle = useState(true);
    final ignoreNextIdleSearch = useState(false);
    final pendingSearchCenter = useState<NLatLng?>(null);
    final currentLocationFuture = useMemoized(() => viewModel.getCurrentLocation());
    final markersMap = useState<Map<String, NMarker>>({});
    final previousSelectedMarkerId = useRef<String?>(null);

    useEffect(() {
      return null;
    }, []);

    ref.listen(
      mapViewModelProvider.select((state) => state.requestState),
      (prev, next) {
        next.whenOrNull(
          error: (error, _) {
            final handledError = error is FlowerException
                ? error
                : FlowerException(message: error.toString());
            UiErrorHandler.handle(context, handledError);
            viewModel.consumeRequestState();
          },
        );
      },
    );

    Future<void> enqueueSearch(NLatLng center, {bool force = false}) async {
      if (!force && !viewModel.shouldSearchByDistance(center)) return;
      pendingSearchCenter.value = center;

      if (state.isSearching) return;
      while (pendingSearchCenter.value != null) {
        final target = pendingSearchCenter.value!;
        pendingSearchCenter.value = null;
        await viewModel.searchNearbyFlowerShops(target);
      }
    }

    Future<void> moveToMyLocationAndSearch() async {
      if (state.isMovingToMyLocation) return;
      final controller = mapController.value;
      if (controller == null) return;

      viewModel.setMovingToMyLocation(true);
      try {
        final location = await viewModel.getCurrentLocation();
        if (location == null) {
          if (!context.mounted) return;
          context.showToast(message: '위치 권한이 필요해요.');
          return;
        }

        final update = NCameraUpdate.scrollAndZoomTo(target: location, zoom: 15);
        update.setAnimation(duration: const Duration(milliseconds: 600));
        ignoreNextIdleSearch.value = true;
        await controller.updateCamera(update);
        await enqueueSearch(location, force: true);
      } finally {
        viewModel.setMovingToMyLocation(false);
      }
    }

    Future<void> handleCameraIdle() async {
      if (isFirstCameraIdle.value) {
        isFirstCameraIdle.value = false;
        return;
      }
      if (ignoreNextIdleSearch.value) {
        ignoreNextIdleSearch.value = false;
        return;
      }
      final controller = mapController.value;
      if (controller == null) return;

      final cameraPosition = await controller.getCameraPosition();
      await enqueueSearch(cameraPosition.target);
    }

    Future<void> initializeMarkers() async {
      final controller = mapController.value;
      if (controller == null) return;

      const flowerIcon = NOverlayImage.fromAssetImage('assets/icons/ic_map_marker.png');

      await controller.clearOverlays(type: NOverlayType.marker);

      final Map<String, NMarker> newMarkersMap = {};

      for (var i = 0; i < state.places.length; i++) {
        final markerId = 'shop_${i + 1}';
        final marker = NMarker(
          id: markerId,
          position: NLatLng(state.places[i].latitude, state.places[i].longitude),
          icon: flowerIcon,
          caption: NOverlayCaption(text: state.places[i].name),
          captionAligns: const [NAlign.bottom],
          size: const Size(56, 56),
        )..setOnTapListener((tap) {
            viewModel.selectPlace(state.places[i], tap.info.id);
            "정보 -> ${state.places[i].name}".logD();
            return null;
          });

        newMarkersMap[markerId] = marker;
      }

      markersMap.value = newMarkersMap;

      if (newMarkersMap.isNotEmpty) {
        await controller.addOverlayAll(newMarkersMap.values.toSet());
      }
    }

    Future<void> updateMarkerSelection() async {
      final controller = mapController.value;
      if (controller == null) return;

      const selectedFlowerIcon = NOverlayImage.fromAssetImage('assets/icons/ic_map_marker_on.png');

      final currentSelectedId = state.selectedMarkerId;
      final prevSelectedId = previousSelectedMarkerId.value;

      // 이전 선택 오버레이 제거
      if (prevSelectedId != null) {
        try {
          final prevOverlayId = '${prevSelectedId}_selected';
          await controller.deleteOverlay(NOverlayInfo(id: prevOverlayId, type: NOverlayType.marker));
        } catch (e) {
          // 오버레이가 없으면 무시
        }
      }

      // 현재 선택 마커 위에 선택 오버레이 추가
      if (currentSelectedId != null && markersMap.value.containsKey(currentSelectedId)) {
        final currentMarker = markersMap.value[currentSelectedId]!;
        final selectedOverlay = NMarker(
          id: '${currentSelectedId}_selected',
          position: currentMarker.position,
          icon: selectedFlowerIcon,
          size: const Size(56, 56),
        );
        
        await controller.addOverlay(selectedOverlay);
      }

      previousSelectedMarkerId.value = currentSelectedId;
    }

    // places가 변경되면 전체 마커 재생성
    useEffect(() {
      if (state.places.isNotEmpty) {
        initializeMarkers();
      }
      return null;
    }, [state.places]);

    // 선택이 변경되면 해당 마커만 업데이트
    useEffect(() {
      if (markersMap.value.isNotEmpty) {
        updateMarkerSelection();
      }
      return null;
    }, [state.selectedMarkerId]);

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
      future: currentLocationFuture,
      builder: (context, snapshot) {
        final initialTarget = snapshot.data ?? _seoulCityHall;
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
                indoorLevelPickerEnable: true,
              ),
              onMapReady: (controller) async {
                mapController.value = controller;
                controller.setLocationTrackingMode(NLocationTrackingMode.follow);
              },
              onCameraIdle: () {
                handleCameraIdle();
              },
            ),
            Positioned(
              right: 16,
              bottom: 20,
              child: FloatingActionButton(
                backgroundColor: context.colorScheme.white,
                heroTag: 'move_to_my_location',
                mini: true,
                onPressed: state.isMovingToMyLocation ? null : moveToMyLocationAndSearch,
                child: state.isMovingToMyLocation
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(Icons.my_location, color: context.colorScheme.primary),
              ),
            ),
            if (state.selectedPlace != null)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: PlaceInfoCard(
                  place: state.selectedPlace!,
                  onClose: () => viewModel.clearSelection(),
                  onOpenKakaoMap: () async {
                    var url = state.selectedPlace?.placeUrl;
                    if (url == null) {
                      context.showToast(message: '카카오맵 URL이 없습니다.');
                    }
                    await UrlLauncherUtil.launchExternalUrl(context, url!);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}