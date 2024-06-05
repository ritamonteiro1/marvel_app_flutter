import 'package:flutter/material.dart';

import 'custom_colors.dart';

class MarvelColors extends ThemeExtension<MarvelColors> {
  const MarvelColors({
    required this.background,
    required this.onBackground,
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color background;
  final Color onBackground;
  final Color primary;
  final Color secondary;
  final Color tertiary;

  static const light = MarvelColors(
    background: CustomColors.white,
    onBackground: CustomColors.eerieBlack,
    primary: CustomColors.glaucous,
    secondary: CustomColors.imperialRed,
    tertiary: CustomColors.xanthous,
  );

  static const dark = MarvelColors(
    background: CustomColors.eerieBlack,
    onBackground: CustomColors.white,
    primary: CustomColors.cornflowerBlue,
    secondary: CustomColors.lightSalmon,
    tertiary: CustomColors.khaki,
  );

  @override
  ThemeExtension<MarvelColors> copyWith({
    Color? background,
    Color? onBackground,
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) {
    return MarvelColors(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  ThemeExtension<MarvelColors> lerp(
    covariant ThemeExtension<MarvelColors>? other,
    double t,
  ) {
    if (other is! MarvelColors) {
      return this;
    }
    return MarvelColors(
      background: Color.lerp(background, other.background, t) ?? background,
      onBackground:
          Color.lerp(onBackground, other.onBackground, t) ?? onBackground,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
    );
  }
}
