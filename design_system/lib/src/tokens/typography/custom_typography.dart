import 'package:flutter/material.dart';

import '../colors/custom_colors.dart';
import 'marvel_fonts.dart';

abstract class CustomTypography {
  static const TextStyle d1Light = TextStyle(
    fontSize: 12,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.eerieBlack,
  );

  static const TextStyle d1Dark = TextStyle(
    fontSize: 12,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.white,
  );

  static const TextStyle d2Light = TextStyle(
    fontSize: 16,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.eerieBlack,
  );

  static const TextStyle d2Dark = TextStyle(
    fontSize: 16,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.white,
  );

  static const TextStyle d3Light = TextStyle(
    fontSize: 20,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.eerieBlack,
  );

  static const TextStyle d3Dark = TextStyle(
    fontSize: 20,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.white,
  );

  static const TextStyle d4Light = TextStyle(
    fontSize: 24,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.eerieBlack,
  );

  static const TextStyle d4Dark = TextStyle(
    fontSize: 24,
    fontFamily: MarvelFonts.marvel,
    color: CustomColors.white,
  );
}
