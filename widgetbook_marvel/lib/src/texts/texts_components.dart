import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class TextsComponents extends WidgetbookComponent {
  TextsComponents()
      : super(
          name: 'Texts',
          useCases: [
            WidgetbookUseCase(
              name: 'Visible Warning Text',
              builder: (context) {
                return const Scaffold(
                  body: Center(
                    child: WarningText(
                      isVisible: true,
                      message: 'Message',
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
