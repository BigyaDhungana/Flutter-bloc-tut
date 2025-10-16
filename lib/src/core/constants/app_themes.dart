import 'package:flutter/material.dart';
import 'package:todo_app/src/core/constants/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
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

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      backgroundColor: AppColors.black.withAlpha(5),
    ),
  );

  static final darkTheme = ThemeData(
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

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      backgroundColor: AppColors.test,
    ),
  );
}
