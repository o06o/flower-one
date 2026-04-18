// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower_shop_place_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlowerShopPlaceInfoModel _$FlowerShopPlaceInfoModelFromJson(
  Map<String, dynamic> json,
) => _FlowerShopPlaceInfoModel(
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  address: json['address'] as String,
  phone: json['phone'] as String?,
  distance: json['distance'] as String?,
  roadAddress: json['roadAddress'] as String?,
  placeUrl: json['placeUrl'] as String?,
);

Map<String, dynamic> _$FlowerShopPlaceInfoModelToJson(
  _FlowerShopPlaceInfoModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'address': instance.address,
  'phone': instance.phone,
  'distance': instance.distance,
  'roadAddress': instance.roadAddress,
  'placeUrl': instance.placeUrl,
};
