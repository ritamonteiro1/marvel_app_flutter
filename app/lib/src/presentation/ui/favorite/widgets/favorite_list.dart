import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/character_details_data.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
    required this.list,
    required this.onClickCard,
  });

  final List<CharacterDetailsData> list;
  final void Function(int) onClickCard;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final theme = Theme.of(context);
    final typography = theme.extension<MarvelTypography>()!;
    final sizeCard = MediaQuery.of(context).size.width * 0.4;

    return list.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final character = list[index];
              return CardPrimary(
                name: character.name,
                comicsLength: character.comics.length,
                onClick: () {
                  onClickCard.call(character.id);
                },
                imageUrl: character.imageUrl,
                imageHeight: sizeCard,
                imageWidth: sizeCard,
              );
            },
          )
        : Center(
            child: Text(
              strings.message_no_favorite_characters,
              style: typography.d3,
            ),
          );
  }
}
