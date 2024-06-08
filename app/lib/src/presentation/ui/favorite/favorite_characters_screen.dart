import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../bloc/favorite/favorite_characters_bloc.dart';
import '../../bloc/favorite/favorite_characters_event.dart';
import '../../bloc/favorite/favorite_characters_state.dart';
import '../../navigation/marvel_routes.dart';
import 'widgets/successfully_favorites.dart';

class FavoriteCharactersScreen extends StatefulWidget {
  const FavoriteCharactersScreen({super.key});

  @override
  State<FavoriteCharactersScreen> createState() =>
      _FavoriteCharactersScreenState();
}

class _FavoriteCharactersScreenState extends State<FavoriteCharactersScreen> {
  final _focusDetectorKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);
    final goRouter = GoRouter.of(context);

    return FocusDetector(
      key: _focusDetectorKey,
      onFocusGained: () {
        context.read<FavoriteCharactersBloc>().add(RequestFavoriteCharacters());
      },
      child: BlocBuilder<FavoriteCharactersBloc, FavoriteCharactersState>(
          builder: (context, state) {
        switch (state) {
          case InitialState():
            context
                .read<FavoriteCharactersBloc>()
                .add(RequestFavoriteCharacters());
            return const LoadingScaffold();
          case SuccessfullyRequestingFavorites():
            return SuccessfullyFavorites(
              list: state.characters,
              onClickCard: (characterId) {
                goRouter.navigateToCharacterDetailsScreen(
                  characterId: characterId,
                );
              },
            );
          case GenericErrorRequestingFavorites():
            return ErrorScaffold(
              onPressedButton: () {
                context
                    .read<FavoriteCharactersBloc>()
                    .add(TryRequestFavoriteCharactersAgain());
              },
            );
          case TryRequestingFavoritesAgain():
            return LoadingScaffold(
              text: strings.message_trying_again,
            );
        }
      }),
    );
  }
}
