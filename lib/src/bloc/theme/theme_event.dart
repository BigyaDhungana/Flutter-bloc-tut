part of "theme_bloc.dart";

sealed class ThemeEvent {}

class ThemeChangeEvent extends ThemeEvent {}

class ColorChangeEvent extends ThemeEvent {}

class FontChangeEvent extends ThemeEvent {}
