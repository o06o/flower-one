import '../../domain/entity/garden_letter_record.dart';
import '../dto/garden_letter_record_response_dto.dart';

extension GardenLetterRecordMapper on GardenLetterRecordResponseDto {
  GardenLetterRecord toEntity() {
    return GardenLetterRecord(
      id: id ?? -1,
      createdAt: createdAt ?? DateTime.now(),
      title: title.trim().isEmpty ? '보낸 편지' : title,
      preview: preview.trim().isEmpty ? title : preview,
      backgroundImageUrl: backgroundImageUrl,
    );
  }
}
