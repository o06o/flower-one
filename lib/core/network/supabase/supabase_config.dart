import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase 초기화/설정 단일 진입점.
///
/// - URL/ANON KEY는 `--dart-define` 또는 `--dart-define-from-file`로 주입합니다.
/// - 예: `--dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`
class SupabaseConfig {
  const SupabaseConfig._();

  static const String _supabaseUrlFromEnv = String.fromEnvironment('SUPABASE_URL');
  static const String _supabaseAnonKeyFromEnv =
      String.fromEnvironment('SUPABASE_ANON_KEY');

  static Future<SupabaseClient> initialize() async {
    final supabaseUrl = _requireEnv(
      name: 'SUPABASE_URL',
      value: _supabaseUrlFromEnv,
    );
    final supabaseAnonKey = _requireEnv(
      name: 'SUPABASE_ANON_KEY',
      value: _supabaseAnonKeyFromEnv,
    );

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
    return Supabase.instance.client;
  }

  static String _requireEnv({required String name, required String value}) {
    if (value.isNotEmpty) return value;

    throw StateError(
      '$name is missing. Run with --dart-define or --dart-define-from-file.',
    );
  }
}
