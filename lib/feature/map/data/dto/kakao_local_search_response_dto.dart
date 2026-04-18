import 'package:json_annotation/json_annotation.dart';

part 'kakao_local_search_response_dto.g.dart';

@JsonSerializable()
class KakaoLocalSearchResponseDto {
  final List<KakaoPlaceDto> documents;
  final KakaoMetaDto meta;

  KakaoLocalSearchResponseDto({
    required this.documents,
    required this.meta,
  });

  factory KakaoLocalSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$KakaoLocalSearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$KakaoLocalSearchResponseDtoToJson(this);
}

@JsonSerializable()
class KakaoPlaceDto {
  @JsonKey(name: 'place_name')
  final String placeName;

  @JsonKey(name: 'x')
  final String longitude;

  @JsonKey(name: 'y')
  final String latitude;

  @JsonKey(name: 'address_name')
  final String addressName;

  @JsonKey(name: 'road_address_name')
  final String? roadAddressName;

  final String? phone;

  final String? distance;

  @JsonKey(name: 'place_url')
  final String? placeUrl;

  KakaoPlaceDto({
    required this.placeName,
    required this.longitude,
    required this.latitude,
    required this.addressName,
    this.roadAddressName,
    this.phone,
    this.distance,
    this.placeUrl,
  });

  factory KakaoPlaceDto.fromJson(Map<String, dynamic> json) =>
      _$KakaoPlaceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$KakaoPlaceDtoToJson(this);
}

@JsonSerializable()
class KakaoMetaDto {
  @JsonKey(name: 'total_count')
  final int totalCount;

  @JsonKey(name: 'pageable_count')
  final int pageableCount;

  @JsonKey(name: 'is_end')
  final bool isEnd;

  KakaoMetaDto({
    required this.totalCount,
    required this.pageableCount,
    required this.isEnd,
  });

  factory KakaoMetaDto.fromJson(Map<String, dynamic> json) =>
      _$KakaoMetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$KakaoMetaDtoToJson(this);
}
