import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String sectionTitle;
  final String sectionTail;
  final void Function()? action;
  const SectionHeading({
    super.key,
    required this.sectionTitle,
    this.sectionTail = 'Show More',
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            sectionTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
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
    );
  }
}
