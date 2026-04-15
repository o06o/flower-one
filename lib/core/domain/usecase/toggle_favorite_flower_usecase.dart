import 'package:flowerone/core/domain/repository/item_interaction_repository.dart';

class ToggleFavoriteFlowerUseCase {
  final ItemInteractionRepository _repository;

  ToggleFavoriteFlowerUseCase(this._repository);

  Future<void> call({required int flowerId, required bool isFavorite}) async {
    if (isFavorite) {
      return await _repository.deleteLikeFlower(flowerId: flowerId);
    } else {
      return await _repository.saveLikeFlower(flowerId: flowerId);
    }
  }
}