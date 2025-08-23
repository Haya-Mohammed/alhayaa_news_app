import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondary,
      showSelectedLabels: false,
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
  );

  // Todo: Add the darkTheme mode
  static final ThemeData darkTheme = ThemeData(
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondary,
      showSelectedLabels: false,
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
  );
}
