import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:alhayaa_news_app/shared/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String sectionTitle;
  final String sectionTail;
  const SectionHeading({
    super.key,
    required this.sectionTitle,
    this.sectionTail = 'Show More',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            sectionTitle,
            style: AppTextStyles.pageTitle,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            sectionTail,
            style: AppTextStyles.newsInfo.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
