import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class RowsComponents extends WidgetbookComponent {
  RowsComponents()
      : super(
          name: 'Rows',
          useCases: [
            WidgetbookUseCase(
              name: 'Favorite',
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: RowFavoriteCharacter(
                      onClick: () {},
                      isFavorite: false,
                    ),
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Unfavorite',
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: RowFavoriteCharacter(
                      onClick: () {},
                      isFavorite: true,
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
