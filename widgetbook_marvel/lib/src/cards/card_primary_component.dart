import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class CardPrimaryComponent extends WidgetbookComponent {
  CardPrimaryComponent()
      : super(
          name: 'Card Primary',
          useCases: [
            WidgetbookUseCase(
              name: 'Horizontal',
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(MarvelSpacing.x300),
                      child: CardPrimary(
                        imageUrl:
                            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
                        name: '3-D Man',
                        comicsLength: 10,
                        onClick: () {},
                        imageWidth: 200,
                        imageHeight: 200,
                      ),
                    ),
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Vertical',
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(MarvelSpacing.x300),
                      child: CardPrimary.vertical(
                        imageUrl:
                            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
                        name: '3-D Man',
                        comicsLength: 5,
                        onClick: () {},
                        imageWidth: 200,
                        imageHeight: 200,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
