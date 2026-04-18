// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalSearchResponseDto _$KakaoLocalSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => KakaoLocalSearchResponseDto(
  documents: (json['documents'] as List<dynamic>)
      .map((e) => KakaoPlaceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: KakaoMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$KakaoLocalSearchResponseDtoToJson(
  KakaoLocalSearchResponseDto instance,
) => <String, dynamic>{'documents': instance.documents, 'meta': instance.meta};

KakaoPlaceDto _$KakaoPlaceDtoFromJson(Map<String, dynamic> json) =>
    KakaoPlaceDto(
      placeName: json['place_name'] as String,
      longitude: json['x'] as String,
      latitude: json['y'] as String,
      addressName: json['address_name'] as String,
      roadAddressName: json['road_address_name'] as String?,
      phone: json['phone'] as String?,
      distance: json['distance'] as String?,
      placeUrl: json['place_url'] as String?,
    );

Map<String, dynamic> _$KakaoPlaceDtoToJson(KakaoPlaceDto instance) =>
    <String, dynamic>{
      'place_name': instance.placeName,
      'x': instance.longitude,
      'y': instance.latitude,
      'address_name': instance.addressName,
      'road_address_name': instance.roadAddressName,
      'phone': instance.phone,
      'distance': instance.distance,
      'place_url': instance.placeUrl,
    };

KakaoMetaDto _$KakaoMetaDtoFromJson(Map<String, dynamic> json) => KakaoMetaDto(
  totalCount: (json['total_count'] as num).toInt(),
  pageableCount: (json['pageable_count'] as num).toInt(),
  isEnd: json['is_end'] as bool,
);

Map<String, dynamic> _$KakaoMetaDtoToJson(KakaoMetaDto instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'pageable_count': instance.pageableCount,
      'is_end': instance.isEnd,
    };
