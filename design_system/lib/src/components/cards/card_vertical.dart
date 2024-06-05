import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({
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
      child: Container(
        width: imageWidth,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(
            MarvelRadius.x10,
          ),
          border: Border.all(
            color: colors.secondary,
            width: MarvelBorder.x2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: CustomNetworkImage(
                imageUrl: imageUrl,
                loadingProgressColor: colors.primary,
                errorIconColor: colors.onBackground,
                width: imageWidth,
                height: imageHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(MarvelSpacing.x200),
              child: Text(
                text,
                style: typography.d3,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
