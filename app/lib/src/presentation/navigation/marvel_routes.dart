import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../bloc/details/character_details_bloc.dart';
import '../bloc/favorite/favorite_characters_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../ui/details/character_details_screen.dart';
import '../ui/favorite/favorite_characters_screen.dart';
import '../ui/home/home_screen.dart';

abstract class MarvelRoutes {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: _home,
    routes: [
      GoRoute(
        name: _home,
        path: _home,
        builder: (context, state) {
          return BlocProvider<HomeBloc>(
            create: (context) => GetIt.instance.get(),
            child: const HomeScreen(),
          );
        },
        routes: [
          GoRoute(
            name: _characterDetails,
            path: '$_characterDetails/:characterId',
            builder: (context, state) {
              final characterId =
                  int.tryParse(state.pathParameters['characterId'] ?? '0') ?? 0;
              return BlocProvider<CharacterDetailsBloc>(
                create: (context) => GetIt.instance.get(),
                child: CharacterDetailsScreen(
                  characterId: characterId,
                ),
              );
            },
          ),
          GoRoute(
            name: _favoriteCharacters,
            path: _favoriteCharacters,
            builder: (context, state) {
              return BlocProvider<FavoriteCharactersBloc>(
                create: (context) => GetIt.instance.get(),
                child: const FavoriteCharactersScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}

extension MarvelRoutesExtensions on GoRouter {
  void navigateToCharacterDetailsScreen({required int characterId}) {
    pushNamed(_characterDetails, pathParameters: {
      'characterId': '$characterId',
    });
  }

  void navigateToFavoriteCharactersScreen() {
    pushNamed(_favoriteCharacters);
  }
}

const _home = '/';
const _favoriteCharacters = 'favoriteCharacters';
const _characterDetails = 'characterDetails';
