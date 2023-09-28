import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundDark),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
