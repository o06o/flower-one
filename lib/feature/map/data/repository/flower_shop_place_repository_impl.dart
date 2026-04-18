import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../../../../core/model/model/flower_shop_place_info_model.dart';
import '../../domain/repository/flower_shop_place_repository.dart';
import '../datastore/flower_shop_place_datasource.dart';

class FlowerShopPlaceRepositoryImpl implements FlowerShopPlaceRepository {
  final FlowerShopPlaceDatasource _dataSource;

  FlowerShopPlaceRepositoryImpl(this._dataSource);

  @override
  Future<List<FlowerShopPlaceInfoModel>> searchNearbyFlowerShops({
    required NLatLng center,
    int radius = 20000,
    int size = 10,
  }) async {
    return await _dataSource.searchNearbyFlowerShops(
      center: center,
      radius: radius,
      size: size,
    );
  }
}
