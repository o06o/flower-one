import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsAuthDatasource {
  final GoTrueClient _authClient;

  SettingsAuthDatasource(this._authClient);

  Future<void> signOut() async {
    await _authClient.signOut();
  }
}
