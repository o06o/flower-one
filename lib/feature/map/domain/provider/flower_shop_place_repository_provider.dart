import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datastore/flower_shop_place_datasource.dart';
import '../../data/repository/flower_shop_place_repository_impl.dart';
import '../repository/flower_shop_place_repository.dart';

part 'flower_shop_place_repository_provider.g.dart';

@riverpod
FlowerShopPlaceRepository flowerShopPlaceRepository(FlowerShopPlaceRepositoryRef ref) {
  final dataSource = ref.watch(flowerShopPlaceDatasourceProvider);
  return FlowerShopPlaceRepositoryImpl(dataSource);
}
