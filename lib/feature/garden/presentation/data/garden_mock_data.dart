import '../model/garden_section_item_model.dart';

const List<GardenFavoriteFlowerItemModel> kGardenMockFavoriteFlowers = [
  GardenFavoriteFlowerItemModel(
    name: '카네이션',
    meaning: '사랑',
    imageUrl:
        'https://images.unsplash.com/photo-1597848212624-e6c2f2b2201e?w=300',
  ),
  GardenFavoriteFlowerItemModel(
    name: '국화',
    meaning: '추모',
    imageUrl:
        'https://images.unsplash.com/photo-1604275686665-0f3c0d22ad43?w=300',
  ),
  GardenFavoriteFlowerItemModel(
    name: '장미',
    meaning: '감사',
    imageUrl:
        'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=300',
  ),
  GardenFavoriteFlowerItemModel(
    name: '백합',
    meaning: '위로',
    imageUrl: 'https://images.unsplash.com/photo-1562690868-60bbe7293e94?w=300',
  ),
  GardenFavoriteFlowerItemModel(
    name: '안개꽃',
    meaning: '응원',
    imageUrl: 'https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=300',
  ),
];

const List<GardenSituationRecordItemModel> kGardenMockSituationRecords = [
  GardenSituationRecordItemModel(
    monthDay: '5.12',
    dayOfWeek: '일',
    title: '엄마 생신',
    description: '엄마 생신을 축하드리고 감사한 마음을 전했어요.',
    tag: '가족',
    imageUrl:
        'https://images.unsplash.com/photo-1597848212624-e6c2f2b2201e?w=300',
  ),
  GardenSituationRecordItemModel(
    monthDay: '4.27',
    dayOfWeek: '토',
    title: '친구의 새로운 시작',
    description: '새로운 도전을 응원하며 작은 꽃다발을 선물했어요.',
    tag: '친구',
    imageUrl:
        'https://images.unsplash.com/photo-1455650451294-57a6ff9d4f8d?w=300',
  ),
];

const List<GardenLetterRecordItemModel> kGardenMockLetterRecords = [
  GardenLetterRecordItemModel(
    title: '엄마에게',
    date: '2024.05.12',
    preview: '엄마, 항상 곁에서\n따뜻하게 지켜줘서 고마워요.\n사랑해요.',
    backgroundImageUrl:
        'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=400',
  ),
  GardenLetterRecordItemModel(
    title: '사랑하는 친구에게',
    date: '2024.04.27',
    preview: '너의 모든 순간을\n응원해! 언제나\n네 편이야',
    backgroundImageUrl:
        'https://images.unsplash.com/photo-1562690868-60bbe7293e94?w=300',
  ),
  GardenLetterRecordItemModel(
    title: '할아버지께',
    date: '2024.04.10',
    preview: '할아버지, 잘 지내고\n계시죠? 언제나\n보고 싶어요.',
    backgroundImageUrl:
        'https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=300',
  ),
];
