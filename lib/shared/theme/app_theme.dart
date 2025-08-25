import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: Colors.black,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondary,
      showSelectedLabels: false,
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      backgroundColor: AppColors.background,
    ),
    cardColor: AppColors.cardColor,
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      // pageTitle
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      // newsTitle
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      // newsDesc
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      // newsInfo
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      // newsDate
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.hint,
      ),
      // newsCategory
      headlineSmall: TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.primary,
      centerTitle: true,
    ),
    cardColor: AppColors.darkCardColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondary,
      showSelectedLabels: false,
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      backgroundColor: AppColors.darkBackground,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      // pageTitle
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      // newsTitle
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      // newsDesc
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white60,
      ),
      // newsInfo
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white60,
      ),
      // newsDate
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.hint,
      ),
      // newsCategory
      headlineSmall: TextStyle(
        fontSize: 16,
        color: AppColors.hint,
      ),
    ),
  );
}
