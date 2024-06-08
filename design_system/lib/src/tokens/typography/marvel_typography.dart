import 'package:flutter/material.dart';

import 'custom_typography.dart';

class MarvelTypography extends ThemeExtension<MarvelTypography> {
  const MarvelTypography({
    required this.d1,
    required this.d2,
    required this.d3,
    required this.d4,
  });

  static const light = MarvelTypography(
    d1: CustomTypography.d1Light,
    d2: CustomTypography.d2Light,
    d3: CustomTypography.d3Light,
    d4: CustomTypography.d4Light,
  );

  static const dark = MarvelTypography(
    d1: CustomTypography.d1Dark,
    d2: CustomTypography.d2Dark,
    d3: CustomTypography.d3Dark,
    d4: CustomTypography.d4Dark,
  );

  final TextStyle d1;
  final TextStyle d2;
  final TextStyle d3;
  final TextStyle d4;

  @override
  MarvelTypography copyWith({
    TextStyle? d1,
    TextStyle? d2,
    TextStyle? d3,
    TextStyle? d4,
  }) {
    return MarvelTypography(
      d1: d1 ?? this.d1,
      d2: d2 ?? this.d3,
      d3: d3 ?? this.d3,
      d4: d4 ?? this.d4,
    );
  }

  @override
  MarvelTypography lerp(
    ThemeExtension<MarvelTypography>? other,
    double t,
  ) {
    if (other is! MarvelTypography) {
      return this;
    }
    return MarvelTypography(
      d1: TextStyle.lerp(d1, other.d1, t) ?? d1,
      d2: TextStyle.lerp(d2, other.d2, t) ?? d2,
      d3: TextStyle.lerp(d3, other.d3, t) ?? d3,
      d4: TextStyle.lerp(d4, other.d4, t) ?? d4,
    );
  }
}
