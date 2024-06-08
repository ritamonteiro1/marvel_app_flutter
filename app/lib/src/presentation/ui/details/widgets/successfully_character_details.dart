import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/character_details_data.dart';
import 'comic_list.dart';
import 'description_character_details.dart';

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
    final isFavorite = character.isFavorite;
    final sizeCard = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.app_bar_title_character_details_screen),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: MarvelSpacing.x350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: MarvelSpacing.x300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CustomNetworkImage(
                        imageUrl: character.imageUrl,
                        loadingProgressColor: colors.primary,
                        errorIconColor: colors.primary,
                        height: sizeCard,
                        width: sizeCard,
                      ),
                    ),
                    const SizedBox(width: MarvelSpacing.x250),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            character.name,
                            style: typography.d4,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          Visibility(
                            visible: character.modified.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: MarvelSpacing.x200,
                              ),
                              child: Text(
                                character.modified.convertDate(),
                                style: typography.d4,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: MarvelSpacing.x300),
                Align(
                  alignment: Alignment.centerRight,
                  child: RowFavoriteCharacter(
                    onClick: toggleCharacter,
                    isFavorite: isFavorite,
                  ),
                ),
                Visibility(
                  visible: character.description.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: MarvelSpacing.x300,
                    ),
                    child: DescriptionCharacterDetails(
                      text: character.description,
                    ),
                  ),
                ),
                Visibility(
                  visible: character.comics.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: MarvelSpacing.x300,
                    ),
                    child: ComicList(list: character.comics),
                  ),
                ),
                const SizedBox(height: MarvelSpacing.x300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
