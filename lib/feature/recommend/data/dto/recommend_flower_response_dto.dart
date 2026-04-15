import 'package:json_annotation/json_annotation.dart';

import 'flower_info_response_dto.dart';

part 'recommend_flower_response_dto.g.dart';

@JsonSerializable()
class RecommendFlowerResultDto {
  final List<FlowerInfoResponseDto> flowers;

  RecommendFlowerResultDto({
    required this.flowers,
  });

  factory RecommendFlowerResultDto.fromJson(Map<String, dynamic> json) =>
      _$RecommendFlowerResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendFlowerResultDtoToJson(this);
}

@JsonSerializable()
class RecommendFlowerResponseDto {
  final RecommendFlowerResultDto result;

  RecommendFlowerResponseDto({
    required this.result,
  });

  factory RecommendFlowerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RecommendFlowerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendFlowerResponseDtoToJson(this);
}
