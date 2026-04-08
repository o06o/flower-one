import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInResult {
  final String idToken;
  final String accessToken;
  final String? serverAuthCode;

  const GoogleSignInResult({
    required this.idToken,
    required this.accessToken,
    this.serverAuthCode,
  });
}

class GoogleSignClient {
  final GoogleSignIn _googleSignIn;

  GoogleSignClient({
    required String clientId,
    required String serverClientId,
    List<String>? scopes,
  }) : _googleSignIn = GoogleSignIn(
    clientId: clientId,
    serverClientId: serverClientId,
    scopes: scopes ?? ['email'],
  );

  Future<GoogleSignInResult?> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final auth = await googleUser.authentication;
        final idToken = auth.idToken;
        final accessToken = auth.accessToken;

        if (idToken == null || idToken.isEmpty) return null;
        if (accessToken == null || accessToken.isEmpty) return null;

        return GoogleSignInResult(
          idToken: idToken,
          accessToken: accessToken,
          serverAuthCode: googleUser.serverAuthCode,
        );
      }
      return null; // 사용자가 로그인을 취소한 경우
    } catch (error) {
      return null; // 에러 처리
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      // ignore sign-out failures
    }
  }
}
