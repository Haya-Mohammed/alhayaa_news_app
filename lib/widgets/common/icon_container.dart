import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class AppIconContainer extends StatelessWidget {
  void Function()? onTap;
  final Color backgroundColor;
  final IconData icon;
  final IconData activatedIcon;
  final Color iconColor;
  final Color activatedIconColor;
  final bool activated;
  final double iconSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  AppIconContainer({
    super.key,
    this.backgroundColor = Colors.white,
    this.activated = false,
    this.onTap,
    required this.icon,
    this.activatedIcon = Icons.done,
    this.iconColor = AppColors.black,
    this.activatedIconColor = AppColors.primary,
    this.iconSize = 20.0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = HomeCubit.get(context).isDark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        child: CircleAvatar(
          radius: 16,
          backgroundColor: isDark ? AppColors.darkCardColor : AppColors.white,
          child: Icon(
            activated ? activatedIcon : icon,
            color: activated
                ? activatedIconColor
                : isDark
                    ? AppColors.white
                    : AppColors.black,
            // color: activated ? activatedIconColor : iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
