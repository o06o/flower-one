enum GardenDetailType { favoriteFlowers, situationRecords, letterRecords }

extension GardenDetailTypeExtension on GardenDetailType {
  String get title {
    switch (this) {
      case GardenDetailType.favoriteFlowers:
        return '즐겨찾기한 꽃';
      case GardenDetailType.situationRecords:
        return '상황 기록';
      case GardenDetailType.letterRecords:
        return '편지 기록';
    }
  }
}
