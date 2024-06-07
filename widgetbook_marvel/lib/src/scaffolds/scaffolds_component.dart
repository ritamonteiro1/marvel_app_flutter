import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';
import 'package:widgetbook/widgetbook.dart';

class ScaffoldsComponent extends WidgetbookComponent {
  ScaffoldsComponent()
      : super(
          name: 'Scaffolds',
          useCases: [
            WidgetbookUseCase(
              name: 'Loading',
              builder: (context) {
                final strings = MarvelStrings.of(context);
                return LoadingScaffold(
                  text: strings.message_trying_again,
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Network Error',
              builder: (context) {
                final strings = MarvelStrings.of(context);

                return ErrorScaffold(
                  iconData: Icons.error_outline_rounded,
                  text: strings.message_generic_error,
                  textButton: strings.message_try_again,
                  onPressedButton: () {},
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Generic Error',
              builder: (context) {
                final strings = MarvelStrings.of(context);

                return ErrorScaffold(
                  iconData: Icons.wifi_off_outlined,
                  text: strings.message_network_error,
                  textButton: strings.message_try_again,
                  onPressedButton: () {},
                );
              },
            ),
          ],
        );
}
