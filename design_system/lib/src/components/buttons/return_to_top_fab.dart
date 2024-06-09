import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class ReturnToTopFAB extends StatelessWidget {
  const ReturnToTopFAB({
    super.key,
    required this.onClick,
  });

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;

    return FloatingActionButton(
      tooltip: strings.semantic_label_floating_action_button,
      backgroundColor: colors.primary,
      onPressed: () {
        onClick.call();
      },
      foregroundColor: colors.background,
      child: const Icon(Icons.arrow_upward),
    );
  }
}
