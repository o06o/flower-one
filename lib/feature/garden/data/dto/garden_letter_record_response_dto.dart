class GardenLetterRecordResponseDto {
  final int id;
  final int requestId;
  final int flowerId;
  final String recipientType;
  final String situationText;
  final String flowerName;
  final String flowerTags;
  final String flowerMeanings;
  final String letterText;
  final DateTime createdAt;
  final String flowerImageUrl;

  const GardenLetterRecordResponseDto({
    required this.id,
    required this.requestId,
    required this.flowerId,
    required this.recipientType,
    required this.situationText,
    required this.flowerName,
    required this.flowerTags,
    required this.flowerMeanings,
    required this.letterText,
    required this.createdAt,
    required this.flowerImageUrl,
  });

  factory GardenLetterRecordResponseDto.fromJson(Map<String, dynamic> json) {
    String? readString(List<String> keys) {
      for (final key in keys) {
        final value = json[key];
        if (value is String && value.trim().isNotEmpty) return value;
      }
      return null;
    }

    int? readInt(List<String> keys) {
      for (final key in keys) {
        final value = json[key];
        if (value is int) return value;
        if (value is String) return int.tryParse(value);
      }
      return null;
    }

    DateTime readDateTime(List<String> keys) {
      final value = readString(keys);
      if (value == null) return DateTime.now();
      return DateTime.tryParse(value)?.toLocal() ?? DateTime.now();
    }

    return GardenLetterRecordResponseDto(
      id: readInt(['id']) ?? -1,
      requestId: readInt(['request_id']) ?? -1,
      flowerId: readInt(['flower_id']) ?? -1,
      recipientType: readString(['recipient_type']) ?? 'other',
      situationText: readString(['situation_text']) ?? '',
      flowerName: readString(['flower_name']) ?? '',
      flowerTags: readString(['flower_tags']) ?? '',
      flowerMeanings: readString(['flower_meanings']) ?? '',
      letterText: readString(['letter_text']) ?? '',
      createdAt: readDateTime(['created_at']),
      flowerImageUrl: readString(['flower_image_url']) ?? '',
    );
  }
}
