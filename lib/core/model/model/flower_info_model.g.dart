// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlowerInfoModel _$FlowerInfoModelFromJson(Map<String, dynamic> json) =>
    _FlowerInfoModel(
      flowerId: (json['flowerId'] as num?)?.toInt(),
      name: json['name'] as String,
      meaning: json['meaning'] as String?,
      reason: json['reason'] as String,
      imageUrl: json['imageUrl'] as String?,
      isFavorited: json['isFavorited'] as bool? ?? false,
    );

Map<String, dynamic> _$FlowerInfoModelToJson(_FlowerInfoModel instance) =>
    <String, dynamic>{
      'flowerId': instance.flowerId,
      'name': instance.name,
      'meaning': instance.meaning,
      'reason': instance.reason,
      'imageUrl': instance.imageUrl,
      'isFavorited': instance.isFavorited,
    };
