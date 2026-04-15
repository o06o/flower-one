/// 작업 배정 Repository Interface
///
/// 담당 기능:
/// - 추천관련 repository
abstract class RecommendRepository {
  /// 작업 배정 생성 (반복 없음)
  Future<void> toggleFavoriteFlower({required int flowerId});
}