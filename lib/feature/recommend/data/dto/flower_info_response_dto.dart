import 'package:json_annotation/json_annotation.dart';

part 'flower_info_response_dto.g.dart';

@JsonSerializable()
class FlowerInfoResponseDto {
  @JsonKey(name: 'flower_id')
  final int? flowerId;
  
  final String name;
  
  final String? meaning;
  
  final String reason;
  
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  
  @JsonKey(name: 'is_favorited')
  final bool isFavorited;
 
  FlowerInfoResponseDto({
    this.flowerId,
    required this.name,
    this.meaning,
    required this.reason,
    this.imageUrl,
    this.isFavorited = false,
  });

  factory FlowerInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FlowerInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FlowerInfoResponseDtoToJson(this);
}