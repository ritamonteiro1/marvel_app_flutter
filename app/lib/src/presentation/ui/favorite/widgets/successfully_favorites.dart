import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/character_details_data.dart';
import 'favorite_list.dart';

class SuccessfullyFavorites extends StatelessWidget {
  const SuccessfullyFavorites({
    super.key,
    required this.list,
    required this.onClickCard,
  });

  final List<CharacterDetailsData> list;
  final void Function(int) onClickCard;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.app_bar_title_favorite_characters_screen),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: MarvelSpacing.x300,
          left: MarvelSpacing.x300,
          right: MarvelSpacing.x300,
        ),
        child: FavoriteList(
          list: list,
          onClickCard: onClickCard,
        ),
      ),
    );
  }
}
