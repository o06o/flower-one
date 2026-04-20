import '../../domain/repository/settings_auth_repository.dart';
import '../datasource/settings_auth_datasource.dart';

class SettingsAuthRepositoryImpl implements SettingsAuthRepository {
  final SettingsAuthDatasource _datasource;

  SettingsAuthRepositoryImpl(this._datasource);

  @override
  Future<void> signOut() async {
    await _datasource.signOut();
  }
}
