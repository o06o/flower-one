import '../../data/dto/recommend_flower_response_dto.dart';
import '../repository/recommend_flower_repository.dart';

class GetRecommendFlowerUseCase {
  final RecommendFlowerRepository _repository;

  GetRecommendFlowerUseCase(this._repository);

  Future<RecommendFlowerResponseDto> call({required String situation}) async {
    return await _repository.getRecommendFlower(situation: situation);
  }
}