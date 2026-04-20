class GardenLetterRecord {
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

  const GardenLetterRecord({
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
}
