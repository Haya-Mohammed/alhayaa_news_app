import 'package:alhayaa_news_app/core/constants/image_strings.dart';
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

  String cleanImageUrl(String? url) {
    if (url == null) return '';
    return url.split('?').first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: (image == null || image!.isEmpty)
          ? const Image(
              image: AssetImage(AppImages.placeholderImage),
              fit: BoxFit.cover,
            )
          : CachedNetworkImage(
              imageUrl: cleanImageUrl(image),
              placeholder: (context, url) => const Image(
                image: AssetImage(AppImages.placeholderImage),
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => const Image(
                image: AssetImage(AppImages.placeholderImage),
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
    );
  }
}
