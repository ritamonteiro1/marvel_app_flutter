import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/character_data.dart';

class CharacterHorizontalList extends StatelessWidget {
  const CharacterHorizontalList({
    super.key,
    required this.list,
    required this.onClickCard,
  });

  final List<CharacterData> list;
  final void Function(int) onClickCard;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSizeWidth = mediaQuery.size.width;
    final sizeCard = (mediaQuery.orientation == Orientation.portrait)
        ? screenSizeWidth * 0.4
        : screenSizeWidth * 0.2;

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final character = list[index];

        return CardPrimary.vertical(
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
      separatorBuilder: (context, index) {
        return const SizedBox(width: MarvelSpacing.x200);
      },
    );
  }
}
