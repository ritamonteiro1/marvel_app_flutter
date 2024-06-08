import 'package:flutter/material.dart';

import '../../../design_system.dart';

class RowFavoriteCharacter extends StatelessWidget {
  const RowFavoriteCharacter({
    super.key,
    required this.text,
    required this.iconData,
    required this.onClick,
  });

  final String text;
  final IconData iconData;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;

    return GestureDetector(
      onTap: onClick,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MarvelRadius.x10,
          ),
          side: BorderSide(
            color: colors.secondary,
            width: MarvelBorder.x1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: MarvelSpacing.x250,
            horizontal: MarvelSpacing.x350,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text.toUpperCase(),
                style: typography.d3,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: MarvelSpacing.x150),
              Icon(
                iconData,
                color: colors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
