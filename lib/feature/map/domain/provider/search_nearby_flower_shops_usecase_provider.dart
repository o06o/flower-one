import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/get_flower_shop_info_usecase.dart';
import 'flower_shop_place_repository_provider.dart';

part 'search_nearby_flower_shops_usecase_provider.g.dart';

@riverpod
SearchNearbyFlowerShopsUseCase searchNearbyFlowerShopsUseCase(SearchNearbyFlowerShopsUseCaseRef ref) {
  final repository = ref.watch(flowerShopPlaceRepositoryProvider);
  return SearchNearbyFlowerShopsUseCase(repository);
}
