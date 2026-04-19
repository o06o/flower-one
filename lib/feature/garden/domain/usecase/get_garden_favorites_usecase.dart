import '../entity/garden_favorite_flower.dart';
import '../repository/garden_repository.dart';

class GetGardenFavoritesUseCase {
  final GardenRepository _repository;

  GetGardenFavoritesUseCase(this._repository);

  Future<List<GardenFavoriteFlower>> call() async {
    return _repository.getFavoriteFlowers();
  }
}
