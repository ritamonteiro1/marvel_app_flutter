import 'package:flutter/material.dart';

import '../../tokens/colors/marvel_colors.dart';
import '../../tokens/sizes/marvel_sizes.dart';
import '../../tokens/typography/marvel_typography.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;

    return Scaffold(
      body: Center(
        child: text != null && text!.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: colors.primary),
                  const SizedBox(height: MarvelSpacing.x400),
                  Text(
                    text!.toUpperCase(),
                    style: typography.d3,
                  ),
                ],
              )
            : CircularProgressIndicator(color: colors.primary),
      ),
    );
  }
}
