import 'package:flowerone/core/model/model/flower_info_model.dart';
import 'package:flowerone/feature/recommend/data/dto/flower_info_response_dto.dart';

extension FlowerMapper on FlowerInfoResponseDto {
  FlowerInfoModel toFlowerInfoModel() {
    return FlowerInfoModel(
      flowerId: flowerId,
      name: name,
      meaning: description,
      reason: reason,
      imageUrl: imageUrl,
      isFavorited: isFavorited,
    );
  }
}