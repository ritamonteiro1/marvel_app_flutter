import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../design_system.dart';

class RowFavoriteCharacter extends StatelessWidget {
  const RowFavoriteCharacter({
    super.key,
    required this.isFavorite,
    required this.onClick,
  });

  final bool isFavorite;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;
    final strings = MarvelStrings.of(context);

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
                (isFavorite ? strings.unfavorite_text : strings.favorite_text)
                    .toUpperCase(),
                style: typography.d3,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: MarvelSpacing.x150),
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: colors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
