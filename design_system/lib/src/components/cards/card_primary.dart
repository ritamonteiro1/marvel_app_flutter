import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import 'card_horizontal.dart';
import 'card_vertical.dart';

class CardPrimary extends StatelessWidget {
  const CardPrimary({
    super.key,
    required this.name,
    required this.comicsLength,
    required this.onClick,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
  }) : isVertical = false;

  const CardPrimary.vertical({
    super.key,
    required this.name,
    required this.comicsLength,
    required this.onClick,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
  }) : isVertical = true;

  final String name;
  final int comicsLength;
  final VoidCallback onClick;
  final bool isVertical;
  final String imageUrl;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final comics = comicsLength > 0 ? comicsLength.toString() : '-';
    final subtitle = '${strings.comics_text} $comics';

    if (isVertical) {
      return CardVertical(
        imageUrl: imageUrl,
        title: name,
        subtitle: subtitle,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
        onClick: onClick,
      );
    }
    return CardHorizontal(
      imageUrl: imageUrl,
      title: name,
      subtitle: subtitle,
      imageHeight: imageHeight,
      imageWidth: imageWidth,
      onClick: onClick,
    );
  }
}
