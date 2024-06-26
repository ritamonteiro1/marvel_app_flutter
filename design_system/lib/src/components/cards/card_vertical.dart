import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({
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
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Card(
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
          child: Stack(
            children: [
              CustomNetworkImage(
                imageUrl: imageUrl,
                loadingProgressColor: colors.primary,
                errorIconColor: colors.onBackground,
                width: imageWidth,
                height: imageHeight,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: imageWidth,
                  color: colors.background,
                  child: Padding(
                    padding: const EdgeInsets.all(MarvelSpacing.x100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title.toUpperCase(),
                          style: typography.d3.bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          subtitle,
                          style: typography.d2.bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
