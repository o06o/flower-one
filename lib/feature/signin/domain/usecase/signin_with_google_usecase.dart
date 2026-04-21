import '../repository/signin_auth_repository.dart';

class SignInWithGoogleUseCase {
  final SignInAuthRepository _repository;

  SignInWithGoogleUseCase(this._repository);

  Future<void> call({
    required String idToken,
    required String accessToken,
  }) async {
    await _repository.signInWithGoogle(
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
