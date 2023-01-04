import 'package:injectable/injectable.dart';

import '../../data/repositories/theme_repository.dart';

@injectable
class ThemeUseCase {
  final ThemeRepository _themeRepository;

  ThemeUseCase(this._themeRepository);

  bool isDarkTheme() {
    return _themeRepository.isDarkTheme();
  }

  toggleTheme() {
    final currentTheme = _themeRepository.isDarkTheme();
    _themeRepository.setTheme(!currentTheme);
  }
}
