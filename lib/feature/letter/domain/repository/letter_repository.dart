import '../../data/dto/make_letter_response_dto.dart';

/// 편지 Repository Interface
///
/// 담당 기능:
/// - 편지 생성 관련 repository
abstract class LetterRepository {
  /// 편지 생성하기
  Future<MakeLetterResponseDto> makeLetter({
    required String message,
    required String flowerName,
  });
}
