import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const themePreference = 'is_dark_theme';

@injectable
class ThemeLocalDataSource {
  final SharedPreferences _sharedPreferences;

  ThemeLocalDataSource(this._sharedPreferences);

  bool isDarkTheme() {
    return _sharedPreferences.getBool(themePreference) ?? false;
  }

  setTheme(bool isDark) {
    _sharedPreferences.setBool(themePreference, isDark);
  }
}
