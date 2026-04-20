import '../entity/garden_letter_record.dart';
import '../repository/garden_repository.dart';

class GetGardenLetterRecordsUseCase {
  final GardenRepository _repository;

  GetGardenLetterRecordsUseCase(this._repository);

  Future<List<GardenLetterRecord>> call({int? limit}) async {
    return _repository.getLetterRecords(limit: limit);
  }
}
