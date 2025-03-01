// persist data to the disk & get data from the disk
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  static const String _darkMode = "darkMode"; // Key

  final SharedPreferences _preferences;

  SettingsRepository(this._preferences);

  // 1. Settind data (disk 에 관련 data 저장)
  Future<void> setDarkMode(bool value) async {
    await _preferences.setBool(_darkMode, value); // Key에 value 저장
  }

  // 2. Reading data
  bool getDarkMode() {
    return _preferences.getBool(_darkMode) ?? false; // Disk에 없으면 false
  }
}
