import '../../domain/repository/garden_repository.dart';
import '../datastore/garden_datasource.dart';
import '../../domain/entity/garden_favorite_flower.dart';
import '../../domain/entity/garden_letter_record.dart';
import '../../domain/entity/garden_situation_record.dart';
import '../mapper/garden_favorite_flower_mapper.dart';
import '../mapper/garden_letter_record_mapper.dart';
import '../mapper/garden_situation_record_mapper.dart';

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

  @override
  Future<List<GardenSituationRecord>> getSituationRecords({int? limit}) async {
    final dtos = await _dataSource.getSituationRecords(limit: limit);
    return dtos
        .map((item) => item.toEntity())
        .whereType<GardenSituationRecord>()
        .toList();
  }

  @override
  Future<List<GardenLetterRecord>> getLetterRecords({int? limit}) async {
    final dtos = await _dataSource.getLetterRecords(limit: limit);
    return dtos.map((item) => item.toEntity()).toList();
  }
}
