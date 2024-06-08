import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class ComicList extends StatelessWidget {
  const ComicList({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final theme = Theme.of(context);
    final typography = theme.extension<MarvelTypography>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.comics_text.toUpperCase(),
          style: typography.d3,
        ),
        const SizedBox(height: MarvelSpacing.x200),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final name = list[index];
            return Padding(
              padding: const EdgeInsets.only(left: MarvelSpacing.x250),
              child: Text('- $name}', style: typography.d3),
            );
          },
        ),
      ],
    );
  }
}
