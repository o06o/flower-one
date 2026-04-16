import 'package:json_annotation/json_annotation.dart';

part 'make_letter_response_dto.g.dart';

@JsonSerializable()
class MakeLetterResultDto {
  final String letter;

  MakeLetterResultDto({
    required this.letter,
  });

  factory MakeLetterResultDto.fromJson(Map<String, dynamic> json) =>
      _$MakeLetterResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MakeLetterResultDtoToJson(this);
}

@JsonSerializable()
class MakeLetterResponseDto {
  final MakeLetterResultDto result;

  MakeLetterResponseDto({
    required this.result,
  });

  factory MakeLetterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MakeLetterResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MakeLetterResponseDtoToJson(this);
}
