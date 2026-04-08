abstract class SecureStorageDataSource {
  Future<void> setAccessToken(String token);
  Future<String?> getAccessToken();

  Future<void> setRefreshToken(String token);
  Future<String?> getRefreshToken();

  Future<void> setPushToken(String token);
  Future<String?> getPushToken();

  Future<void> deleteAccessToken();
  Future<void> deleteRefreshToken();
  Future<void> clearAll();
}
