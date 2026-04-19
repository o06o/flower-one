class GardenFavoriteFlowerItemModel {
  final String name;
  final String meaning;
  final String imageUrl;

  const GardenFavoriteFlowerItemModel({
    required this.name,
    required this.meaning,
    required this.imageUrl,
  });
}

class GardenSituationRecordItemModel {
  final String monthDay;
  final String dayOfWeek;
  final String title;
  final String description;
  final String tag;
  final String imageUrl;

  const GardenSituationRecordItemModel({
    required this.monthDay,
    required this.dayOfWeek,
    required this.title,
    required this.description,
    required this.tag,
    required this.imageUrl,
  });
}

class GardenLetterRecordItemModel {
  final String title;
  final String date;
  final String preview;
  final String backgroundImageUrl;

  const GardenLetterRecordItemModel({
    required this.title,
    required this.date,
    required this.preview,
    required this.backgroundImageUrl,
  });
}
