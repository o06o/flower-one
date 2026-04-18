import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/model/model/flower_shop_place_info_model.dart';
import '../../../../libraries/logger/logger.dart';
import '../api/kakao_local_api.dart';
import '../api/kakao_local_api_provider.dart';
import '../mapper/kakao_place_mapper.dart';

part 'flower_shop_place_datasource.g.dart';

class FlowerShopPlaceDatasource {
  final KakaoLocalApi _api;

  FlowerShopPlaceDatasource(this._api);

  Future<List<FlowerShopPlaceInfoModel>> searchNearbyFlowerShops({
    required NLatLng center,
    int radius = 20000,
    int size = 10,
  }) async {
    try {
      final response = await _api.searchKeyword(
        query: '꽃집',
        latitude: center.latitude.toString(),
        longitude: center.longitude.toString(),
        radius: radius,
        size: size,
      );

      "Kakao API response: ${response.documents.length} places found".logI();

      return response.documents
          .map((dto) {
            try {
              return dto.toFlowerShopPlaceInfoModel();
            } catch (e) {
              "Failed to map place: $e".logE();
              return null;
            }
          })
          .whereType<FlowerShopPlaceInfoModel>()
          .toList();
    } catch (e) {
      "Kakao API error: $e".logE();
      throw Exception('Failed to search flower shops: $e');
    }
  }
}

@Riverpod()
FlowerShopPlaceDatasource flowerShopPlaceDatasource(FlowerShopPlaceDatasourceRef ref) {
  final api = ref.watch(kakaoLocalApiProvider);
  return FlowerShopPlaceDatasource(api);
}
