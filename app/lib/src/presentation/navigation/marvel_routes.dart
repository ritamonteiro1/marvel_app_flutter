import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../bloc/favorite/favorite_characters_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../ui/details/character_details_screen.dart';
import '../ui/favorite/favorite_characters_screen.dart';
import '../ui/home/home_screen.dart';

abstract class MarvelRoutes {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: home,
    routes: [
      GoRoute(
        name: home,
        path: home,
        builder: (context, state) {
          return BlocProvider<HomeBloc>(
            create: (context) => GetIt.instance.get(),
            child: const HomeScreen(),
          );
        },
        routes: [
          GoRoute(
            name: characterDetails,
            path: characterDetails,
            builder: (context, state) {
              return const CharacterDetailsScreen();
            },
          ),
          GoRoute(
            name: favoriteCharacters,
            path: favoriteCharacters,
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

  static const home = '/';
  static const favoriteCharacters = 'favoriteCharacters';
  static const characterDetails = 'characterDetails';
}
