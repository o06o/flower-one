// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_letter_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeLetterResultDto _$MakeLetterResultDtoFromJson(Map<String, dynamic> json) =>
    MakeLetterResultDto(letter: json['letter'] as String);

Map<String, dynamic> _$MakeLetterResultDtoToJson(
  MakeLetterResultDto instance,
) => <String, dynamic>{'letter': instance.letter};

MakeLetterResponseDto _$MakeLetterResponseDtoFromJson(
  Map<String, dynamic> json,
) => MakeLetterResponseDto(
  result: MakeLetterResultDto.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MakeLetterResponseDtoToJson(
  MakeLetterResponseDto instance,
) => <String, dynamic>{'result': instance.result};
