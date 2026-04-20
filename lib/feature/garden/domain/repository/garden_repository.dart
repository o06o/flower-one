import '../entity/garden_favorite_flower.dart';
import '../entity/garden_letter_record.dart';
import '../entity/garden_situation_record.dart';

abstract class GardenRepository {
  Future<List<GardenFavoriteFlower>> getFavoriteFlowers();
  Future<List<GardenSituationRecord>> getSituationRecords({int? limit});
  Future<List<GardenLetterRecord>> getLetterRecords({int? limit});
}
