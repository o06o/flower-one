import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/supabase/supabase_providers.dart';
import '../../data/datasource/signin_auth_datasource.dart';
import '../../data/repository/signin_auth_repository_impl.dart';
import '../repository/signin_auth_repository.dart';
import '../usecase/signin_with_apple_usecase.dart';
import '../usecase/signin_with_google_usecase.dart';

final signInAuthDatasourceProvider = Provider<SignInAuthDatasource>((ref) {
  final authClient = ref.watch(supabaseAuthProvider);
  return SignInAuthDatasource(authClient);
});

final signInAuthRepositoryProvider = Provider<SignInAuthRepository>((ref) {
  final datasource = ref.watch(signInAuthDatasourceProvider);
  return SignInAuthRepositoryImpl(datasource);
});

final signInWithGoogleUseCaseProvider = Provider<SignInWithGoogleUseCase>((
  ref,
) {
  final repository = ref.watch(signInAuthRepositoryProvider);
  return SignInWithGoogleUseCase(repository);
});

final signInWithAppleUseCaseProvider = Provider<SignInWithAppleUseCase>((ref) {
  final repository = ref.watch(signInAuthRepositoryProvider);
  return SignInWithAppleUseCase(repository);
});
