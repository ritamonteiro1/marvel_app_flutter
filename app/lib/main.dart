import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import 'src/presentation/navigation/marvel_routes.dart';
import 'src/presentation/utils/app_initial_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitialConfig.execute();
  runApp(const MarvelApp());
}

class MarvelApp extends StatefulWidget {
  const MarvelApp({super.key});

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => MarvelStrings.of(context).app_name,
      routerConfig: MarvelRoutes.router,
      theme: MarvelThemeMode.light,
      darkTheme: MarvelThemeMode.dark,
      supportedLocales: MarvelStrings.delegate.supportedLocales,
      localizationsDelegates: const [
        MarvelStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
