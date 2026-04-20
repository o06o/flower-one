class GardenLetterRecordResponseDto {
  final int? id;
  final DateTime? createdAt;
  final String title;
  final String preview;
  final String backgroundImageUrl;

  const GardenLetterRecordResponseDto({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.preview,
    required this.backgroundImageUrl,
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

    DateTime? readDateTime(List<String> keys) {
      final value = readString(keys);
      if (value == null) return null;
      return DateTime.tryParse(value)?.toLocal();
    }

    final parsedCreatedAt = readDateTime(['created_at', 'createdAt']);
    final parsedTitle =
        readString([
          'recipient_type',
          'situation',
          'title',
          'occasion',
          'input_text',
        ]) ??
        '보낸 편지';
    final parsedPreview =
        readString([
          'letter_content',
          'letter',
          'description',
          'message',
          'input_text',
        ]) ??
        parsedTitle;

    return GardenLetterRecordResponseDto(
      id: readInt(['id', 'history_id']),
      createdAt: parsedCreatedAt,
      title: parsedTitle,
      preview: parsedPreview,
      backgroundImageUrl:
          readString(['image_url', 'public_url', 'background_image_url']) ?? '',
    );
  }
}
