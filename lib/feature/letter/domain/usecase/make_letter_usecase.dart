import '../../data/dto/make_letter_response_dto.dart';
import '../repository/letter_repository.dart';

class MakeLetterUseCase {
  final LetterRepository _repository;

  MakeLetterUseCase(this._repository);

  Future<MakeLetterResponseDto> call({
    required int requestId,
    required int flowerId,
    required String recipient,
  }) async {
    return await _repository.makeLetter(
      requestId: requestId,
      flowerId: flowerId,
      recipient: recipient,
    );
  }
}
