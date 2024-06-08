import 'package:flutter/material.dart';

import '../../tokens/colors/colors.dart';
import '../../tokens/sizes/marvel_sizes.dart';
import '../../tokens/typography/typography.dart';
import '../network_image/custom_network_image.dart';

class CardHorizontal extends StatelessWidget {
  const CardHorizontal({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.imageHeight,
    required this.imageWidth,
    required this.onClick,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final double imageHeight;
  final double imageWidth;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;

    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: colors.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MarvelRadius.x10,
          ),
          side: BorderSide(
            color: colors.primary,
            width: MarvelBorder.x1,
          ),
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: imageUrl,
              loadingProgressColor: colors.primary,
              errorIconColor: colors.onBackground,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(width: MarvelSpacing.x300),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: typography.d3.bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    subtitle,
                    style: typography.d2.bold,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(width: MarvelSpacing.x200),
          ],
        ),
      ),
    );
  }
}
