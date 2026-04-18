import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:flowerone/core/model/model/flower_shop_place_info_model.dart';
import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/provider/search_nearby_flower_shops_usecase_provider.dart';

part 'map_view_model.freezed.dart';
part 'map_view_model.g.dart';

@freezed
abstract class MapState with _$MapState {
  factory MapState({
    @Default([]) List<FlowerShopPlaceInfoModel> places,
    FlowerShopPlaceInfoModel? selectedPlace,
    String? selectedMarkerId,
    NLatLng? lastSearchedCenter,
    NLatLng? currentLocation,
    @Default(false) bool isSearching,
    @Default(false) bool isMovingToMyLocation,
    @Default(AsyncData<void>(null)) AsyncValue<void> requestState,
  }) = _MapState;

  factory MapState.init() => MapState(
        places: [],
        selectedPlace: null,
        selectedMarkerId: null,
        lastSearchedCenter: null,
        currentLocation: null,
        isSearching: false,
        isMovingToMyLocation: false,
        requestState: const AsyncData<void>(null),
      );
}

@Riverpod(keepAlive: false)
class MapViewModel extends _$MapViewModel {
  static const double _searchMoveThresholdMeters = 700;

  @override
  MapState build() {
    return MapState.init();
  }

  Future<NLatLng?> getCurrentLocation() async {
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
    state = state.copyWith(currentLocation: location);
    return location;
  }

  Future<void> searchNearbyFlowerShops(NLatLng center) async {
    if (state.isSearching) return;

    state = state.copyWith(isSearching: true);

    try {
      final useCase = ref.read(searchNearbyFlowerShopsUseCaseProvider);
      final places = await useCase.call(
        center: center,
        radius: 20000,
        size: 10,
      );
      
      state = state.copyWith(
        places: places,
        lastSearchedCenter: center,
        isSearching: false,
      );
    } catch (error) {
      "꽃집 검색 오류: ${error.toString()}".logE();
      state = state.copyWith(
        isSearching: false,
        requestState: AsyncError<void>(
          FlowerException(message: '꽃집을 찾을 수 없습니다.'),
          StackTrace.current,
        ),
      );
    }
  }

  bool shouldSearchByDistance(NLatLng center) {
    final last = state.lastSearchedCenter;
    if (last == null) return true;
    final distance = Geolocator.distanceBetween(
      last.latitude,
      last.longitude,
      center.latitude,
      center.longitude,
    );
    return distance >= _searchMoveThresholdMeters;
  }

  void selectPlace(FlowerShopPlaceInfoModel place, String markerId) {
    state = state.copyWith(
      selectedPlace: place,
      selectedMarkerId: markerId,
    );
  }

  void clearSelection() {
    state = state.copyWith(
      selectedPlace: null,
      selectedMarkerId: null,
    );
  }

  void setMovingToMyLocation(bool isMoving) {
    state = state.copyWith(isMovingToMyLocation: isMoving);
  }

  void consumeRequestState() {
    state = state.copyWith(requestState: const AsyncData<void>(null));
  }
}
