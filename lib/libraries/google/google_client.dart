import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

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
  static const String _iosClientIdFromEnv = String.fromEnvironment(
    'GOOGLE_IOS_CLIENT_ID',
  );
  static const String _androidClientIdFromEnv = String.fromEnvironment(
    'GOOGLE_ANDROID_CLIENT_ID',
  );
  static const String _serverClientIdFromEnv = String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
  );
  static const List<String> _defaultScopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  final GoogleSignIn _googleSignIn;
  static Future<void>? _initializeFuture;

  GoogleSignClient._() : _googleSignIn = GoogleSignIn.instance;

  factory GoogleSignClient() {
    return GoogleSignClient._();
  }

  String? get _clientId {
    if (kIsWeb) return null;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _iosClientIdFromEnv.isEmpty ? null : _iosClientIdFromEnv;
      case TargetPlatform.android:
        return _androidClientIdFromEnv.isEmpty ? null : _androidClientIdFromEnv;
      default:
        return null;
    }
  }

  String? get _serverClientId =>
      _serverClientIdFromEnv.isEmpty ? null : _serverClientIdFromEnv;

  Future<void> _ensureInitialized() {
    _initializeFuture ??= _googleSignIn.initialize(
      clientId: _clientId,
      serverClientId: _serverClientId,
    );
    return _initializeFuture!;
  }

  Future<GoogleSignInResult?> signIn() async {
    try {
      await _ensureInitialized();
      if (!_googleSignIn.supportsAuthenticate()) return null;

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: _defaultScopes,
      );

      final idToken = googleUser.authentication.idToken;
      if (idToken == null || idToken.isEmpty) return null;

      final authorizationClient = googleUser.authorizationClient;
      final GoogleSignInClientAuthorization authorization =
          await authorizationClient.authorizationForScopes(_defaultScopes) ??
          await authorizationClient.authorizeScopes(_defaultScopes);
      if (authorization.accessToken.isEmpty) return null;

      final GoogleSignInServerAuthorization? serverAuthorization =
          await authorizationClient.authorizeServer(_defaultScopes);

      return GoogleSignInResult(
        idToken: idToken,
        accessToken: authorization.accessToken,
        serverAuthCode: serverAuthorization?.serverAuthCode,
      );
    } on GoogleSignInException catch (error) {
      if (error.code == GoogleSignInExceptionCode.canceled) return null;
      return null;
    } catch (error) {
      return null; // 에러 처리
    }
  }

  Future<void> signOut() async {
    try {
      await _ensureInitialized();
      await _googleSignIn.signOut();
    } catch (error) {
      // ignore sign-out failures
    }
  }
}
