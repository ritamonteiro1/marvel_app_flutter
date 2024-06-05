import 'package:flutter/material.dart';

import '../../tokens/colors/colors.dart';
import '../../tokens/sizes/marvel_sizes.dart';
import '../../tokens/typography/typography.dart';
import '../network_image/custom_network_image.dart';

class CardHorizontal extends StatelessWidget {
  const CardHorizontal({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.imageHeight,
    required this.imageWidth,
    required this.onClick,
  });

  final String imageUrl;
  final String text;
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
            color: colors.secondary,
            width: MarvelBorder.x2,
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
            Text(
              text,
              style: typography.d3,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}