class GardenFavoriteFlowerResponseDto {
  final int? flowerId;
  final String name;
  final String? meaning;
  final String? imageUrl;

  const GardenFavoriteFlowerResponseDto({
    required this.flowerId,
    required this.name,
    required this.meaning,
    required this.imageUrl,
  });

  factory GardenFavoriteFlowerResponseDto.fromJson(Map<String, dynamic> json) {
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

    return GardenFavoriteFlowerResponseDto(
      flowerId: readInt(['flower_id', 'flowerId', 'id']),
      name:
          readString(['korean_name', 'name', 'flower_name']) ??
          readString(['english_name', 'scientific_name']) ??
          '',
      meaning: readString(['description', 'meaning']),
      imageUrl: readString(['image_url', 'imageUrl']),
    );
  }
}
