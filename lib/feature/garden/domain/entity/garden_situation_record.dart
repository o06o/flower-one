class GardenSituationRecord {
  final int id;
  final DateTime createdAt;
  final String title;
  final String description;
  final String tag;
  final String imageUrl;

  const GardenSituationRecord({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.tag,
    required this.imageUrl,
  });
}
