import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ComicList extends StatelessWidget {
  const ComicList({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.extension<MarvelTypography>()!;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final name = list[index];
        return Text(name, style: typography.d3);
      },
    );
  }
}
