import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        child: CircleAvatar(
          radius: 16,
          backgroundColor: backgroundColor,
          child: Icon(
            activated ? activatedIcon : icon,
            color: activated ? activatedIconColor : iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
