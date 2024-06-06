import 'package:get_it/get_it.dart';

import '../../domain/use_case/get_character_details/get_character_details_use_case.dart';
import '../../domain/use_case/get_character_list/get_character_list_use_case.dart';
import '../../domain/use_case/get_favorite_characters/get_favorite_characters_use_case.dart';
import '../../domain/use_case/toggle_character_favorite/toggle_character_favorite_use_case.dart';
import '../bloc/details/character_details_bloc.dart';
import '../bloc/favorite/favorite_characters_bloc.dart';
import '../bloc/home/home_bloc.dart';

void presentationDI() {
  final getIt = GetIt.instance;
  getIt
    ..registerFactory(
      () => HomeBloc(
        getCharacterListUseCase: getIt.get<GetCharacterListUseCase>(),
      ),
    )
    ..registerFactory(
      () => FavoriteCharactersBloc(
        getFavoriteCharactersUseCase: getIt.get<GetFavoriteCharactersUseCase>(),
      ),
    )
    ..registerFactory(
      () => CharacterDetailsBloc(
        getCharacterDetailsUseCase: getIt.get<GetCharacterDetailsUseCase>(),
        toggleCharacterFavoriteUseCase:
            getIt.get<ToggleCharacterFavoriteUseCase>(),
      ),
    );
}
