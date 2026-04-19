import '../../domain/entity/garden_favorite_flower.dart';
import '../dto/garden_favorite_flower_response_dto.dart';

extension GardenFavoriteFlowerMapper on GardenFavoriteFlowerResponseDto {
  GardenFavoriteFlower? toEntity() {
    final id = flowerId;
    if (id == null) return null;

    return GardenFavoriteFlower(
      flowerId: id,
      name: name,
      meaning: meaning ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
