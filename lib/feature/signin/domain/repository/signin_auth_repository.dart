abstract class SignInAuthRepository {
  Future<void> signInWithGoogle({
    required String idToken,
    required String accessToken,
  });

  Future<void> signInWithApple();
}
