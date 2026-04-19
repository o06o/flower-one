import '../../domain/repository/garden_repository.dart';
import '../datastore/garden_datasource.dart';
import '../../domain/entity/garden_favorite_flower.dart';
import '../mapper/garden_favorite_flower_mapper.dart';

class GardenRepositoryImpl implements GardenRepository {
  final GardenDatasource _dataSource;

  GardenRepositoryImpl(this._dataSource);

  @override
  Future<List<GardenFavoriteFlower>> getFavoriteFlowers() async {
    final dtos = await _dataSource.getFavoriteFlowers();
    return dtos
        .map((item) => item.toEntity())
        .whereType<GardenFavoriteFlower>()
        .toList();
  }
}
