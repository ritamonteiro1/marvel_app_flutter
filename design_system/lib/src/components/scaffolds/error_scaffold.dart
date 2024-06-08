import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../tokens/colors/marvel_colors.dart';
import '../../tokens/sizes/marvel_sizes.dart';
import '../../tokens/typography/marvel_typography.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressedButton,
    required this.iconData,
  });

  final String text;
  final IconData iconData;
  final String textButton;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MarvelSpacing.x500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                iconData,
                color: colors.primary,
                size: 100,
              ),
              const SizedBox(height: MarvelSpacing.x300),
              Text(
                text.toUpperCase(),
                style: typography.d3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MarvelSpacing.x400),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                ),
                onPressed: onPressedButton,
                child: Text(
                  textButton,
                  style: typography.d3.copyWith(
                    color: colors.background,
                  ).bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
