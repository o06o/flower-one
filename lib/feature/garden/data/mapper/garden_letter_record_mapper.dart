import '../../domain/entity/garden_letter_record.dart';
import '../dto/garden_letter_record_response_dto.dart';

extension GardenLetterRecordMapper on GardenLetterRecordResponseDto {
  GardenLetterRecord toEntity() {
    return GardenLetterRecord(
      id: id,
      requestId: requestId,
      flowerId: flowerId,
      recipientType: recipientType,
      situationText: situationText,
      flowerName: flowerName,
      flowerTags: flowerTags,
      flowerMeanings: flowerMeanings,
      letterText: letterText,
      createdAt: createdAt,
      flowerImageUrl: flowerImageUrl,
    );
  }
}
