import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';

ThemeData getLightThemeData() {
  final ThemeData themeData = ThemeData(
    primarySwatch: Colors.blueGrey,
  );
  return themeData.copyWith(
    inputDecorationTheme: _inputDecorationTheme(themeData),
  );
}

ThemeData getDarkThemeData() {
  final ThemeData themeData = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
  );
  return themeData.copyWith(
    colorScheme: themeData.colorScheme.copyWith(
      secondary: Colors.blueGrey.shade400,
    ),
    inputDecorationTheme: _inputDecorationTheme(themeData),
  );
}

ThemeMode getThemeMode(BuildContext context) {
  ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
  return themeCubit.isDark ? ThemeMode.dark : ThemeMode.light;
}

InputDecorationTheme _inputDecorationTheme(ThemeData themeData) {
  return themeData.inputDecorationTheme.copyWith(
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueGrey,
        width: 2.0,
      ),
    ),
  );
}
