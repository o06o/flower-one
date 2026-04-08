import 'package:shared_preferences/shared_preferences.dart';

class PreferenceStorage {
  final SharedPreferences _prefs;

  PreferenceStorage(this._prefs);

  // Generic write method
  Future<void> write<T>({required String key, required T value}) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw ArgumentError("Unsupported value type: ${value.runtimeType}");
    }
  }

  // Generic read method
  T? read<T>({required String key}) {
    return _prefs.get(key) as T?;
  }

  Future<void> delete({required String key}) async {
    await _prefs.remove(key);
  }

  Future<void> deleteAll() async {
    await _prefs.clear();
  }
}
