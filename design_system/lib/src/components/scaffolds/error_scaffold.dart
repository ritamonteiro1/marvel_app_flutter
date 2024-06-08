import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    super.key,
    required this.onPressedButton,
  }) : isNetworkError = false;

  const ErrorScaffold.network({
    super.key,
    required this.onPressedButton,
  }) : isNetworkError = true;

  final VoidCallback onPressedButton;
  final bool isNetworkError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final typography = theme.extension<MarvelTypography>()!;
    final strings = MarvelStrings.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MarvelSpacing.x500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                isNetworkError
                    ? Icons.wifi_off_outlined
                    : Icons.error_outline_rounded,
                color: colors.primary,
                size: 100,
              ),
              const SizedBox(height: MarvelSpacing.x300),
              Text(
                (isNetworkError
                        ? strings.message_network_error
                        : strings.message_generic_error)
                    .toUpperCase(),
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
                  strings.message_try_again,
                  style: typography.d3.copyWith(color: colors.background).bold,
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
