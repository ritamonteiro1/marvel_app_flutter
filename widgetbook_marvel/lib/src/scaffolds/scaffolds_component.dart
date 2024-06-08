import 'package:design_system/design_system.dart';
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
                return ErrorScaffold(
                  onPressedButton: () {},
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Generic Error',
              builder: (context) {
                return ErrorScaffold.network(
                  onPressedButton: () {},
                );
              },
            ),
          ],
        );
}
