import 'package:flutter/material.dart';

import '../../../design_system.dart';

class WarningText extends StatelessWidget {
  const WarningText({
    super.key,
    required this.isVisible,
    required this.message,
  });

  final bool isVisible;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.extension<MarvelTypography>()!;

    return Visibility(
      visible: isVisible,
      child: Text(
        message,
        style: typography.d2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
