part of 'theme_cubit.dart';

/*
 Extending with Equatable is avoided to ensure the same state can be fired
 multiple times (ThemeChanged can be fired multiple times based on
 user interaction)
 */
@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {}
