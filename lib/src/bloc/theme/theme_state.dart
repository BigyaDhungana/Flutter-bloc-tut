part of "theme_bloc.dart";

sealed class ThemeState {
  final ThemeMode themeMode;
  final String fontFamily;
  final Color buttonColor;

  ThemeState({
    required this.themeMode,
    required this.fontFamily,
    required this.buttonColor,
  });
}

class ThemeUpdateState extends ThemeState {
  ThemeUpdateState({
    required super.themeMode,
    required super.fontFamily,
    required super.buttonColor,
  });
}

class FontChanged {}

class ColorChanged {}
