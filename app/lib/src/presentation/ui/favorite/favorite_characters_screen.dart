import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class FavoriteCharactersScreen extends StatefulWidget {
  const FavoriteCharactersScreen({super.key});

  @override
  State<FavoriteCharactersScreen> createState() =>
      _FavoriteCharactersScreenState();
}

class _FavoriteCharactersScreenState extends State<FavoriteCharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
          MarvelStrings.of(context).app_bar_title_favorite_characters_screen),
    ));
  }
}
