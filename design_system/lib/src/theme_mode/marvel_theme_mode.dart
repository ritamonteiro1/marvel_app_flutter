import 'package:flutter/material.dart';

import '../tokens/colors/colors.dart';
import '../tokens/typography/typography.dart';

abstract class MarvelThemeMode {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: MarvelFonts.marvel,
    useMaterial3: true,
    extensions: const [
      MarvelColors.light,
      MarvelTypography.light,
    ],
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: MarvelFonts.marvel,
    useMaterial3: true,
    extensions: const [
      MarvelColors.dark,
      MarvelTypography.dark,
    ],
  );
}
