import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../../../../core/model/model/flower_shop_place_info_model.dart';
import '../repository/flower_shop_place_repository.dart';

class SearchNearbyFlowerShopsUseCase {
  final FlowerShopPlaceRepository _repository;

  SearchNearbyFlowerShopsUseCase(this._repository);

  Future<List<FlowerShopPlaceInfoModel>> call({
    required NLatLng center,
    int radius = 20000,
    int size = 10,
  }) async {
    return await _repository.searchNearbyFlowerShops(
      center: center,
      radius: radius,
      size: size,
    );
  }
}
