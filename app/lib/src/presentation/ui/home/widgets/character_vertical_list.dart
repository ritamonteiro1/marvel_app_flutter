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
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final character = list[index];
        return CardPrimary(
          text: character.name,
          onClick: () {
            onClickCard.call(character.id);
          },
          imageUrl: character.imageUrl,
          imageHeight: 120,
          imageWidth: 120,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: MarvelSpacing.x100);
      },
    );
  }
}
