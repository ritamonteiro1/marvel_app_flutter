import 'package:app/src/presentation/bloc/home/home_bloc.dart';
import 'package:app/src/presentation/ui/details/character_details_screen.dart';
import 'package:app/src/presentation/ui/favorite/favorite_characters_screen.dart';
import 'package:app/src/presentation/ui/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

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
            name: characterList,
            path: characterList,
            builder: (context, state) {
              return const CharacterDetailsScreen();
            },
          ),
          GoRoute(
            name: characterDetails,
            path: characterDetails,
            builder: (context, state) {
              return const FavoriteCharactersScreen();
            },
          ),
        ],
      ),
    ],
  );

  static const home = '/';
  static const characterList = 'characterList';
  static const characterDetails = 'characterDetails';
}
