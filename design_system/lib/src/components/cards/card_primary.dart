import 'package:flutter/material.dart';

import 'card_horizontal.dart';
import 'card_vertical.dart';

class CardPrimary extends StatelessWidget {
  const CardPrimary({
    super.key,
    required this.text,
    required this.onClick,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
  }) : isVertical = false;

  const CardPrimary.vertical({
    super.key,
    required this.text,
    required this.onClick,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
  }) : isVertical = true;

  final String text;
  final VoidCallback onClick;
  final bool isVertical;
  final String imageUrl;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return CardVertical(
        imageUrl: imageUrl,
        text: text,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
        onClick: onClick,
      );
    }
    return CardHorizontal(
      imageUrl: imageUrl,
      text: text,
      imageHeight: imageHeight,
      imageWidth: imageWidth,
      onClick: onClick,
    );
  }
}
