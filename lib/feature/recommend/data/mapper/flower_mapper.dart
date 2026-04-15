import 'package:flowerone/core/model/model/flower_info_model.dart';
import 'package:flowerone/feature/recommend/data/dto/flower_info_response_dto.dart';

extension FlowerMapper on FlowerInfoResponseDto {
  /// WorkOptionModel → CreateTaskAssignRequestDto
  /// 반복 없는 단일 작업 배정 생성 시 사용
  FlowerInfoModel toFlowerInfoModel() {
    return FlowerInfoModel(
      flowerId: flowerId,
      name: name,
      meaning: meaning,
      reason: reason,
      imageUrl: imageUrl,
      isFavorited: isFavorited,
    );
  }
}