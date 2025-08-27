import 'package:alhayaa_news_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String sectionTitle;
  final String sectionTail;
  final void Function()? action;
  final bool showTail;

  const SectionHeading({
    super.key,
    required this.sectionTitle,
    this.sectionTail = 'Show More',
    this.action,
    this.showTail = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              sectionTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          if (showTail)
            TextButton(
              onPressed: action,
              child: Text(
                sectionTail,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.primary),
              ),
            ),
        ],
      ),
    );
  }
}
