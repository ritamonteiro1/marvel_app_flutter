import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';
import 'package:widgetbook/widgetbook.dart';

class RowsComponents extends WidgetbookComponent {
  RowsComponents()
      : super(
          name: 'Rows',
          useCases: [
            WidgetbookUseCase(
              name: 'Favorite',
              builder: (context) {
                final strings = MarvelStrings.of(context);

                return Scaffold(
                  body: Center(
                    child: RowFavoriteCharacter(
                      onClick: () {},
                      text: strings.favorite_text,
                      iconData: Icons.favorite,
                    ),
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Unfavorite',
              builder: (context) {
                final strings = MarvelStrings.of(context);

                return Scaffold(
                  body: Center(
                    child: RowFavoriteCharacter(
                      onClick: () {},
                      text: strings.unfavorite_text,
                      iconData: Icons.favorite_border_outlined,
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
