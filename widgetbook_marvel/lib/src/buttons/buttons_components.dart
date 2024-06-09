import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonsComponents extends WidgetbookComponent {
  ButtonsComponents()
      : super(
          name: 'Buttons',
          useCases: [
            WidgetbookUseCase(
              name: 'FAB',
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: ReturnToTopFAB(
                      onClick: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
