import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class RowFavoriteCharacter extends StatelessWidget {
  const RowFavoriteCharacter({
    super.key,
    required this.toggleCharacter,
    required this.isFavorite,
  });

  final VoidCallback toggleCharacter;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;

    return GestureDetector(
      onTap: toggleCharacter,
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
                isFavorite ? strings.unfavorite_text : strings.favorite_text,
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
