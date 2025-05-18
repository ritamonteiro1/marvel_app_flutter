import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internationalization/internationalization.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    await _pumpWidget(tester);
    expect(find.text('message'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (tester) async {
    const testKey = Key('WarningTextKey');
    await _pumpWidget(tester);
    expect(find.byKey(testKey), findsOneWidget);
  });
}

Future<void> _pumpWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: MarvelThemeMode.light,
      darkTheme: MarvelThemeMode.dark,
      supportedLocales: MarvelStrings.delegate.supportedLocales,
      localizationsDelegates: const [
        MarvelStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const WarningText(
        isVisible: true,
        message: 'message',
      ),
    ),
  );
}
