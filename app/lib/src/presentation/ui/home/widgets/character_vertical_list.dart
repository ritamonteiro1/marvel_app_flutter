import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/character_data.dart';

class CharacterVerticalList extends StatelessWidget {
  const CharacterVerticalList({
    super.key,
    required this.list,
    required this.onClickCard,
  });

  final List<CharacterData> list;
  final void Function(int) onClickCard;

  @override
  Widget build(BuildContext context) {
    final sizeCard = MediaQuery.of(context).size.width * 0.4;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
      separatorBuilder: (context, index) {
        return const SizedBox(height: MarvelSpacing.x100);
      },
    );
  }
}
