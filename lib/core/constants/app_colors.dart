import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color background = Color(0xFFF8F8F8);
  static const Color primary = Color(0xFF009290);
  static const Color secondary = Color(0xFFc1d42f);
  static const Color hint = Colors.grey;
  static Color cardColor = const Color(0xFF90d3cd).withOpacity(0.5);

  /// Dark Theme
  static const Color darkBackground = Color(0xFF252526);
  static const Color darkCardColor = Color(0xFF2C2C2C);

  /// App Color Palette
  static const Color teal = Color(0xFF009290); // primary
  static const Color darkTeal = Color(0xFF008381);
  static const Color lightTeal = Color(0xFF90d3cd);
  static const Color oily = Color(0xFFc1d42f); // secondary
  static const Color darkOily = Color(0xFFa9bc38);
}
