import '../repository/signin_auth_repository.dart';

class SignInWithAppleUseCase {
  final SignInAuthRepository _repository;

  SignInWithAppleUseCase(this._repository);

  Future<void> call() async {
    await _repository.signInWithApple();
  }
}
