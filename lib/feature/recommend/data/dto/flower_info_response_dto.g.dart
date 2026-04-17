// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlowerInfoResponseDto _$FlowerInfoResponseDtoFromJson(
  Map<String, dynamic> json,
) => FlowerInfoResponseDto(
  flowerId: (json['flower_id'] as num?)?.toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  reason: json['reason'] as String,
  imageUrl: json['image_url'] as String?,
  isFavorited: json['is_favorited'] as bool? ?? false,
);

Map<String, dynamic> _$FlowerInfoResponseDtoToJson(
  FlowerInfoResponseDto instance,
) => <String, dynamic>{
  'flower_id': instance.flowerId,
  'name': instance.name,
  'description': instance.description,
  'reason': instance.reason,
  'image_url': instance.imageUrl,
  'is_favorited': instance.isFavorited,
};
