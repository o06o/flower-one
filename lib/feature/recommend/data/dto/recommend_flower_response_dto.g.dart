// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_flower_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendFlowerResultDto _$RecommendFlowerResultDtoFromJson(
  Map<String, dynamic> json,
) => RecommendFlowerResultDto(
  flowers: (json['flowers'] as List<dynamic>)
      .map((e) => FlowerInfoResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  requestId: (json['request_id'] as num).toInt(),
);

Map<String, dynamic> _$RecommendFlowerResultDtoToJson(
  RecommendFlowerResultDto instance,
) => <String, dynamic>{
  'request_id': instance.requestId,
  'flowers': instance.flowers,
};

RecommendFlowerResponseDto _$RecommendFlowerResponseDtoFromJson(
  Map<String, dynamic> json,
) => RecommendFlowerResponseDto(
  result: RecommendFlowerResultDto.fromJson(
    json['result'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$RecommendFlowerResponseDtoToJson(
  RecommendFlowerResponseDto instance,
) => <String, dynamic>{'result': instance.result};
