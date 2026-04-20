import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/supabase/supabase_providers.dart';
import '../../data/datasource/settings_auth_datasource.dart';
import '../../data/repository/settings_auth_repository_impl.dart';
import '../repository/settings_auth_repository.dart';
import '../usecase/sign_out_usecase.dart';

final settingsAuthDatasourceProvider = Provider<SettingsAuthDatasource>((ref) {
  final authClient = ref.watch(supabaseAuthProvider);
  return SettingsAuthDatasource(authClient);
});

final settingsAuthRepositoryProvider = Provider<SettingsAuthRepository>((ref) {
  final datasource = ref.watch(settingsAuthDatasourceProvider);
  return SettingsAuthRepositoryImpl(datasource);
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final repository = ref.watch(settingsAuthRepositoryProvider);
  return SignOutUseCase(repository);
});
