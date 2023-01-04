import 'package:injectable/injectable.dart';

import '../sources/theme_local_data_source.dart';

@injectable
class ThemeRepository {
  final ThemeLocalDataSource _localDataSource;

  ThemeRepository(this._localDataSource);

  bool isDarkTheme() {
    return _localDataSource.isDarkTheme();
  }

  setTheme(bool isDark) {
    _localDataSource.setTheme(isDark);
  }
}
