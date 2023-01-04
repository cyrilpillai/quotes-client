import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/theme_usecase.dart';

part 'theme_state.dart';

///Cubit is a lightweight state management solution. It is a subset of the
///bloc package that does not rely on events and instead uses methods to emit
///new states.
/// Every cubit requires an initial state which will be the state of the
/// cubit before emit has been called. The current state of a cubit can be
/// accessed via the state getter.
/// https://pub.dev/packages/cubit
@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  final ThemeUseCase _themeUseCase;

  ThemeCubit(this._themeUseCase) : super(ThemeInitial());

  bool get isDark => _themeUseCase.isDarkTheme();

  void toggleTheme() {
    _themeUseCase.toggleTheme();
    emit(ThemeChanged());
  }
}
