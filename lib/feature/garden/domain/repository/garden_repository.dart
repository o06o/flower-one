import '../entity/garden_favorite_flower.dart';

abstract class GardenRepository {
  Future<List<GardenFavoriteFlower>> getFavoriteFlowers();
}
