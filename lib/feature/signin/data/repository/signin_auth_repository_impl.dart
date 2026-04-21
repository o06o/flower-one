import '../../domain/repository/signin_auth_repository.dart';
import '../datasource/signin_auth_datasource.dart';

class SignInAuthRepositoryImpl implements SignInAuthRepository {
  final SignInAuthDatasource _datasource;

  SignInAuthRepositoryImpl(this._datasource);

  @override
  Future<void> signInWithGoogle({
    required String idToken,
    required String accessToken,
  }) async {
    await _datasource.signInWithGoogle(
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<void> signInWithApple() async {
    await _datasource.signInWithApple();
  }
}
