import '../../data/dto/make_letter_response_dto.dart';
import '../repository/letter_repository.dart';

class MakeLetterUseCase {
  final LetterRepository _repository;

  MakeLetterUseCase(this._repository);

  Future<MakeLetterResponseDto> call({
    required String message,
    required String flowerName,
  }) async {
    return await _repository.makeLetter(
      message: message,
      flowerName: flowerName,
    );
  }
}
