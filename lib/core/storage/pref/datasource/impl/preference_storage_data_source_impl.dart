import '../../preferences_storage.dart';
import '../preference_storage_data_source.dart';

// ==================== 상수 정의 ====================
const String boolPushNotificationEnabled = 'push_notification_enabled';
const String boolOnboardingShown = 'onboarding_shown';

class PreferenceStorageDataSourceImpl implements PreferenceStorageDataSource {
  final PreferenceStorage _preferenceStorage;

  PreferenceStorageDataSourceImpl(this._preferenceStorage);

  @override
  Future<void> write<T>({required String key, required T value}) {
    return _preferenceStorage.write(key: key, value: value);
  }

  @override
  T? read<T>({required String key}) {
    return _preferenceStorage.read<T>(key: key);
  }

  @override
  Future<void> delete({required String key}) {
    return _preferenceStorage.delete(key: key);
  }

  @override
  Future<void> deleteAll() {
    return _preferenceStorage.deleteAll();
  }

  // ==================== 구체적인 기능별 메서드 구현 ====================

  @override
  Future<void> setPushNotificationEnabled(bool value) {
    return _preferenceStorage.write<bool>(key: boolPushNotificationEnabled, value: value);
  }

  @override
  bool? getPushNotificationEnabled() {
    return _preferenceStorage.read<bool>(key: boolPushNotificationEnabled);
  }

  @override
  Future<void> setOnboardingShown(bool value) {
    return _preferenceStorage.write<bool>(key: boolOnboardingShown, value: value);
  }

  @override
  bool? getOnboardingShown() {
    return _preferenceStorage.read<bool>(key: boolOnboardingShown);
  }
}