/// 담당 기능:
/// - 상호작용 repository
abstract class ItemInteractionRepository {
  /// 작업 배정 생성 (반복 없음)
  Future<void> saveLikeFlower({required int flowerId});
  Future<void> deleteLikeFlower({required int flowerId});
}