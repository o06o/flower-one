import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_api.dart';

/// Supabase는 `main()`에서 이미 `SupabaseConfig.initialize()`로 초기화되어 있다고 가정합니다.
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final supabaseAuthProvider = Provider<GoTrueClient>((ref) {
  return ref.watch(supabaseClientProvider).auth;
});

final supabaseApiProvider = Provider<SupabaseApi>((ref) {
  return SupabaseApi(ref.watch(supabaseClientProvider));
});

