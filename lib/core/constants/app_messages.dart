/// 앱 전역 메시지 상수
///
/// - UI 표시용 한글 메시지를 한 곳에서 관리
/// - 추후 다국어 대응 시 ARB 파일로 마이그레이션 용이
class AppMessages {
  const AppMessages._();

  // ========== 공통 오류 메시지 ==========
  static const String unknownError = '알 수 없는 오류가 발생했습니다.';
  static const String temporaryError = '일시적인 오류입니다.';
  static const String generalError = '오류가 발생했어요';

  // ========== 즐겨찾기 관련 ==========
  static const String favoriteAdded = '즐겨찾기에 추가했어요';
  static const String favoriteRemoved = '즐겨찾기에서 해제했어요';
  static const String favoriteNoId = '이 꽃은 아직 즐겨찾기할 수 없어요';
  static const String favoriteFailed = '즐겨찾기에 실패했어요';
  static const String favoriteLoadFailed = '즐겨찾기를 불러오지 못했어요';
  static const String favoriteEmpty = '즐겨찾기한 꽃이 없어요';

  // ========== 홈 화면 ==========
  static const String homeTitle1 = '오늘 어떤 꽃 한송이를';
  static const String homeTitle2 = '선물하고 싶으세요?';
  static const String homePlaceholder = '상황을 입력해 주세요.';
  static const String homeRecommendButton = '추천받기';
  static const String homeNetworkError = '전송 중 오류가 발생했어요.';

  // ========== 추천 화면 ==========
  static const String recommendTitle = '당신을 위한 추천';
  static const String recommendSubtitle = '오늘의 상황을 담아 고른 세 가지 꽃입니다.';
  static const String recommendReasonLabel = '추천 이유';
  static const String recommendEmpty = '추천 결과가 없어요.';
  static const String recommendFindShopButton = '주변 꽃집 찿기';

  // ========== 정원 화면 ==========
  static const String gardenTitle = '나의 정원';
  static const String gardenRetry = '다시 시도';

  // ========== 로그인 ==========
  static const String signInMessage = '꽃 한 송이로\n말로 전하기 어려운 마음\n전해보세요';
  static const String signInGoogleFailed = '구글 로그인에 실패했어요.';
  static const String signInAppleFailed = '애플 로그인에 실패했어요.';
  static const String signInFailedPrefix = '로그인 실패: ';
}
