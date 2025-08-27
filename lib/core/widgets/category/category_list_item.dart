import 'package:alhayaa_news_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryListItem({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Theme.of(context).textTheme.headlineSmall!.color ??
                    AppColors.white,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.primary : Colors.transparent,
        ),
        child: Center(
          child: Text(
            name,
            style: isSelected
                ? Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.white)
                : Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
