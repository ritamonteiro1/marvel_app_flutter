import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/cards/card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internationalization/internationalization.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    await _pumpWidget(tester);
    expect(find.text('subtitle'), findsOneWidget);
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
      home: CardHorizontal(
        imageUrl:
            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
        title: 'title',
        subtitle: 'subtitle',
        imageHeight: 50,
        imageWidth: 50,
        onClick: () {},
      ),
    ),
  );
}
