abstract class PreferenceStorageDataSource {
  // Generic methods for any type
  Future<void> write<T>({required String key, required T value});
  T? read<T>({required String key});
  Future<void> delete({required String key});
  Future<void> deleteAll();

  /// 푸시 알림 설정
  Future<void> setPushNotificationEnabled(bool value);
  bool? getPushNotificationEnabled();

  /// 온보딩 표시 여부
  Future<void> setOnboardingShown(bool value);
  bool? getOnboardingShown();
}