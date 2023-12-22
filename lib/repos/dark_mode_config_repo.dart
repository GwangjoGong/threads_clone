import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepository {
  final SharedPreferences _sharedPreferences;

  DarkModeConfigRepository({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  bool get isDarkMode => _sharedPreferences.getBool("isDarkMode") ?? false;

  Future<void> toggleDarkMode() async {
    await _sharedPreferences.setBool("isDarkMode", !isDarkMode);
  }
}
