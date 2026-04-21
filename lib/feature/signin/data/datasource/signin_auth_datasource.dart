import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flowerone/core/model/exception/exception.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInAuthDatasource {
  final GoTrueClient _authClient;

  SignInAuthDatasource(this._authClient);

  Future<void> signInWithGoogle({
    required String idToken,
    required String accessToken,
  }) async {
    await _authClient.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> signInWithApple() async {
    if (Platform.isIOS) {
      // 🍎 [iOS 환경] 작성하신 완벽한 네이티브 코드 적용
      final rawNonce = _generateNonce();
      final hashedNonce = _sha256OfString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        // iOS는 네이티브 창을 띄우므로 webAuthenticationOptions가 필요 없습니다.
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null || idToken.isEmpty) {
        throw FlowerException(message: 'Apple idToken is missing.');
      }

      await _authClient.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );
    } else {
      // 🤖 [Android 환경] Supabase의 OAuth 기능 사용
      // Apple의 POST 응답 처리를 Supabase 서버가 대신해주고, 딥링크로 깔끔하게 돌려줍니다.
      await _authClient.signInWithOAuth(
        OAuthProvider.apple,
        scopes: 'email name',
        redirectTo:
            'com.o06.flowerone://login-callback', // 아까 AndroidManifest에 등록한 길
      );
    }
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256OfString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
