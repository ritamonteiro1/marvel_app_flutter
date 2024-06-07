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
            children: [
              Icon(
                iconData,
                color: colors.primary,
                size: 100,
              ),
              const SizedBox(height: MarvelSpacing.x300),
              Text(
                text,
                style: typography.d3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MarvelSpacing.x400),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                  ),
                  onPressed: onPressedButton,
                  child: Text(
                    textButton,
                    style: typography.d3.copyWith(
                      color: colors.background,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}