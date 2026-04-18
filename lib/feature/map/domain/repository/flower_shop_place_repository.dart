import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../../../../core/model/model/flower_shop_place_info_model.dart';

abstract class FlowerShopPlaceRepository {
  Future<List<FlowerShopPlaceInfoModel>> searchNearbyFlowerShops({
    required NLatLng center,
    int radius = 20000,
    int size = 10,
  });
}
