import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';
import 'package:widgetbook/widgetbook.dart';

import 'src/components.dart';

void main() {
  runApp(const WidgetBookMarvel());
}

class WidgetBookMarvel extends StatelessWidget {
  const WidgetBookMarvel({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: MarvelThemeMode.light,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: MarvelThemeMode.dark,
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.android.mediumPhone,
            Devices.ios.iPhone13,
          ],
          initialDevice: Devices.android.mediumPhone,
        ),
        LocalizationAddon(
          locales: MarvelStrings.delegate.supportedLocales,
          localizationsDelegates: const [
            MarvelStrings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ],
      directories: [
        CardPrimaryComponent(),
        ScaffoldsComponent(),
        RowsComponents(),
        ButtonsComponents(),
        TextsComponents(),
      ],
    );
  }
}
