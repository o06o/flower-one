import '../../domain/entity/garden_situation_record.dart';
import '../dto/garden_situation_record_response_dto.dart';

extension GardenSituationRecordMapper on GardenSituationRecordResponseDto {
  GardenSituationRecord? toEntity() {
    final recordId = id;
    final recordCreatedAt = createdAt;

    if (recordId == null || recordCreatedAt == null) return null;
    if (title.trim().isEmpty) return null;

    return GardenSituationRecord(
      id: recordId,
      createdAt: recordCreatedAt,
      title: title,
      description: description,
      tag: tag,
      imageUrl: imageUrl,
    );
  }
}
