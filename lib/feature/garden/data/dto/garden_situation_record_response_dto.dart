class GardenSituationRecordResponseDto {
  final int? id;
  final DateTime? createdAt;
  final String title;
  final String description;
  final String tag;
  final String imageUrl;

  const GardenSituationRecordResponseDto({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.tag,
    required this.imageUrl,
  });

  factory GardenSituationRecordResponseDto.fromJson(Map<String, dynamic> json) {
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

    String buildDescriptionFromRecommendations(dynamic rawRecommendations) {
      if (rawRecommendations is! List) return '';

      final names = <String>[];

      for (final item in rawRecommendations) {
        if (item is! Map) continue;
        final recommendation = Map<String, dynamic>.from(item);
        final flowerRaw = recommendation['flowers'];
        if (flowerRaw is! Map) continue;
        final flower = Map<String, dynamic>.from(flowerRaw);
        final name = flower['korean_name'];
        if (name is String && name.trim().isNotEmpty) {
          names.add(name.trim());
        }
      }

      if (names.isEmpty) return '';
      return '추천 꽃: ${names.take(3).join(', ')}';
    }

    return GardenSituationRecordResponseDto(
      id: readInt(['id', 'history_id']),
      createdAt: readDateTime(['created_at', 'createdAt']),
      title: readString(['input_text', 'situation', 'title', 'occasion']) ?? '',
      description: buildDescriptionFromRecommendations(
        json['recommendation_results'],
      ),
      tag: '추천 기록',
      imageUrl: '',
    );
  }
}
