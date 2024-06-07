import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({
    super.key,
    required this.characterId,
  });

  final int characterId;

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            MarvelStrings.of(context).app_bar_title_character_details_screen),
      ),
    );
  }
}
