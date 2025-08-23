import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle pageTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle newsTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle newsDesc = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );
  static const TextStyle newsInfo = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle newsDate = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.hint,
  );
  static const TextStyle newsCategory = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );
}
