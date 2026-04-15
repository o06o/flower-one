import '../../data/dto/recommend_flower_response_dto.dart';

/// 작업 배정 Repository Interface
///
/// 담당 기능:
/// - 추천관련 repository
abstract class RecommendFlowerRepository {
  /// 꽃 추천 받기
  Future<RecommendFlowerResponseDto> getRecommendFlower({required String situation});
}