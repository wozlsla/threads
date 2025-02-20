// persist data to the disk & get data from the disk
import 'package:shared_preferences/shared_preferences.dart';

class ThemeConfigRepository {
  // Key
  static const String _darkMode = "darkMode";

  final SharedPreferences _preferences;

  ThemeConfigRepository(this._preferences);

  // 1. Settind data (disk 에 관련 data 저장)
  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkMode, value);
  }

  // 2. Reading data
  bool isDarkMode() {
    return _preferences.getBool(_darkMode) ?? false; // disk 에 없으면 false
  }
}
