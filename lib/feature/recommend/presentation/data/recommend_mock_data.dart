import '../../../../core/model/model/flower_info_model.dart';

/// 추천 화면 UI 작업용 목업. 라우터에서 `extra`로 리스트를 넘기면 이 값 대신 사용됩니다.
const List<FlowerInfoModel> kRecommendMockFlowers = [
  FlowerInfoModel(
    flowerId: 207,
    isFavorited: true,
    name: '핑크 장미',
    meaning: '사랑의 기쁨, 감사, 우아함',
    reason:
        '따뜻한 마음을 전하고 싶을 때 잘 어울려요. 응원과 감사를 부드럽게 담을 수 있어요.',
    imageUrl:
        'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=400',
  ),
  FlowerInfoModel(
    flowerId: 132,
    name: '수국',
    meaning: '변함없는 마음, 진심',
    reason:
        '오래 알고 지낸 분께 마음을 담아 전하기 좋아요. 진심 어린 관계를 표현할 때 어울려요.',
    imageUrl:
        'https://images.unsplash.com/photo-1508610048659-a06b669e3321?w=400',
  ),
  FlowerInfoModel(
    flowerId: 206,
    name: '프리지아',
    meaning: '순수한 마음, 우정',
    reason:
        '가벼운 향과 맑은 이미지로 부담 없이 기분을 북돋아 주고 싶은 날에 추천해요.',
    imageUrl: null,
  ),
];
