class GardenLetterRecord {
  final int id;
  final DateTime createdAt;
  final String title;
  final String preview;
  final String backgroundImageUrl;

  const GardenLetterRecord({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.preview,
    required this.backgroundImageUrl,
  });
}
