import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.loadingProgressColor,
    required this.errorIconColor,
    required this.height,
    required this.width,
  });

  final String imageUrl;
  final Color loadingProgressColor;
  final Color errorIconColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: loadingProgressColor,
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.image_not_supported_sharp,
          size: width / 4,
          color: errorIconColor,
        ),
      ),
    );
  }
}
