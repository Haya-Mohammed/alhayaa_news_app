import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatefulWidget {
  final String name;
  const CategoryListItem({
    super.key,
    required this.name,
  });

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isSelected = !isSelected;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
        child: Text(
          widget.name,
          style: isSelected
              ? Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.white)
              : Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
