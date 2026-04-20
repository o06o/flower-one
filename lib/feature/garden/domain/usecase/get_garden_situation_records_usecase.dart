import '../entity/garden_situation_record.dart';
import '../repository/garden_repository.dart';

class GetGardenSituationRecordsUseCase {
  final GardenRepository _repository;

  GetGardenSituationRecordsUseCase(this._repository);

  Future<List<GardenSituationRecord>> call({int? limit}) async {
    return _repository.getSituationRecords(limit: limit);
  }
}
