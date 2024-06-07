import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/character_details_data.dart';
import 'comic_list.dart';

class SuccessfullyCharacterDetails extends StatelessWidget {
  const SuccessfullyCharacterDetails({
    super.key,
    required this.toggleCharacter,
    required this.character,
  });

  final VoidCallback toggleCharacter;
  final CharacterDetailsData character;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.app_bar_title_character_details_screen),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: MarvelSpacing.x300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: MarvelSpacing.x300),
                Center(
                  child: CustomNetworkImage(
                    imageUrl: character.imageUrl,
                    loadingProgressColor: colors.primary,
                    errorIconColor: colors.primary,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(height: MarvelSpacing.x300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      character.name,
                      style: typography.d3,
                    ),
                    const SizedBox(width: MarvelSpacing.x250),
                    GestureDetector(
                      onTap: toggleCharacter,
                      child: Icon(
                        character.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ),
                if (character.comics.isNotEmpty) ...[
                  const SizedBox(height: MarvelSpacing.x300),
                  Text(
                    character.description,
                    style: typography.d3,
                    textAlign: TextAlign.justify,
                  ),
                ],
                const SizedBox(height: MarvelSpacing.x300),
                Text(
                  character.modified.convertDate(),
                  style: typography.d3,
                ),
                const SizedBox(height: MarvelSpacing.x300),
                if (character.comics.isNotEmpty) ...[
                  Text(
                    strings.comics_text,
                    style: typography.d3,
                  ),
                  const SizedBox(height: MarvelSpacing.x300),
                  ComicList(list: character.comics),
                ],
                const SizedBox(height: MarvelSpacing.x300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
