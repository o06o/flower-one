import '../../secure_storage.dart';
import '../secure_storage_data_source.dart';

class SecureStorageDataSourceImpl implements SecureStorageDataSource {
  final SecureStorage _secureStorage;

  SecureStorageDataSourceImpl(this._secureStorage);

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _pushTokenKey = 'push_token';

  @override
  Future<void> setAccessToken(String token) {
    return _secureStorage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<String?> getAccessToken() {
    return _secureStorage.read(key: _accessTokenKey);
  }

  @override
  Future<void> setRefreshToken(String token) {
    return _secureStorage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<String?> getRefreshToken() {
    return _secureStorage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> setPushToken(String token) {
    return _secureStorage.write(key: _pushTokenKey, value: token);
  }

  @override
  Future<String?> getPushToken() {
    return _secureStorage.read(key: _pushTokenKey);
  }

  @override
  Future<void> deleteAccessToken() {
    return _secureStorage.delete(key: _accessTokenKey);
  }

  @override
  Future<void> deleteRefreshToken() {
    return _secureStorage.delete(key: _refreshTokenKey);
  }

  @override
  Future<void> clearAll() {
    return _secureStorage.deleteAll();
  }
}
