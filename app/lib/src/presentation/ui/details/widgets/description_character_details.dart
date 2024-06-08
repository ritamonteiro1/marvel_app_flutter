import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DescriptionCharacterDetails extends StatelessWidget {
  const DescriptionCharacterDetails({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.extension<MarvelTypography>()!;

    return Text(
      text,
      style: typography.d3,
      textAlign: TextAlign.justify,
    );
  }
}
