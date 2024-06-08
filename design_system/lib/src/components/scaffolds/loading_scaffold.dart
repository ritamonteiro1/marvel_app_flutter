import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../tokens/colors/marvel_colors.dart';
import '../../tokens/sizes/marvel_sizes.dart';
import '../../tokens/typography/marvel_typography.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({
    super.key,
  }) : hasMessage = false;

  final bool hasMessage;

  const LoadingScaffold.message({
    super.key,
  }) : hasMessage = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;
    final strings = MarvelStrings.of(context);

    return Scaffold(
      body: Center(
        child: hasMessage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: colors.primary),
                  const SizedBox(height: MarvelSpacing.x400),
                  Text(
                    (strings.message_trying_again).toUpperCase(),
                    style: typography.d3,
                  ),
                ],
              )
            : CircularProgressIndicator(color: colors.primary),
      ),
    );
  }
}
