import 'package:flutter/material.dart';

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
      body: Center(
        child: Text(widget.characterId.toString()),
      ),
    );
  }
}
