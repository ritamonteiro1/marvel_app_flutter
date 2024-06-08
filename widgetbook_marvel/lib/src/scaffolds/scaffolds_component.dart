import 'package:design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class ScaffoldsComponent extends WidgetbookComponent {
  ScaffoldsComponent()
      : super(
          name: 'Scaffolds',
          useCases: [
            WidgetbookUseCase(
              name: 'Loading',
              builder: (context) {
                return const LoadingScaffold();
              },
            ),
            WidgetbookUseCase(
              name: 'Loading with message',
              builder: (context) {
                return const LoadingScaffold.message();
              },
            ),
            WidgetbookUseCase(
              name: 'Network Error',
              builder: (context) {
                return ErrorScaffold.network(
                  onPressedButton: () {},
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Generic Error',
              builder: (context) {
                return ErrorScaffold(
                  onPressedButton: () {},
                );
              },
            ),
          ],
        );
}
