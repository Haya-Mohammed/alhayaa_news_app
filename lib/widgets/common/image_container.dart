import 'package:alhayaa_news_app/shared/constants/image_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String? image;
  const ImageContainer({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        imageUrl: image ?? AppImages.placeholderImage,
        placeholder: (context, url) =>
            const Image(image: AssetImage(AppImages.placeholderImage)),
        errorWidget: (context, url, error) =>
            const Image(image: AssetImage(AppImages.placeholderImage)),
        fit: BoxFit.cover,
      ),
    );
  }
}
