import 'package:flutter/material.dart';
import 'package:todo_app/src/core/constants/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme(String fontFamily) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.black,
        secondary: AppColors.secondary,
        onSecondary: AppColors.black,
        error: AppColors.secondary,
        onError: AppColors.white,
        surface: AppColors.white,
        onSurface: AppColors.black,
      ),

      fontFamily: fontFamily,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black,
        backgroundColor: AppColors.black.withAlpha(5),
      ),
    );
  }

  static ThemeData darkTheme(String fontFamily) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        onSecondary: AppColors.white,
        error: AppColors.secondary,
        onError: AppColors.black,
        surface: AppColors.black,
        onSurface: AppColors.white,
      ),
      fontFamily: fontFamily,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.white,
        backgroundColor: AppColors.test,
      ),
    );
  }
}
