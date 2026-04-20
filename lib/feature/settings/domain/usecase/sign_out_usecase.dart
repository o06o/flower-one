import '../repository/settings_auth_repository.dart';

class SignOutUseCase {
  final SettingsAuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> call() async {
    await _repository.signOut();
  }
}
