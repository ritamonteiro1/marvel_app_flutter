import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

import '../repository/marvel_repository.dart';
import '../use_case/get_character_details/get_character_details_use_case.dart';
import '../use_case/get_character_details/get_character_details_use_case_impl.dart';
import '../use_case/get_character_list/get_character_list_use_case.dart';
import '../use_case/get_character_list/get_character_list_use_case_impl.dart';
import '../use_case/get_favorite_characters/get_favorite_characters_use_case.dart';
import '../use_case/get_favorite_characters/get_favorite_characters_use_case_impl.dart';
import '../use_case/toggle_character_favorite/toggle_character_favorite_use_case.dart';
import '../use_case/toggle_character_favorite/toggle_character_favorite_use_case_impl.dart';

void domainDI() {
  final getIt = GetIt.instance;

  getIt
    ..registerFactory<GetCharacterListUseCase>(
      () => GetCharacterListUseCaseImpl(
        repository: getIt.get<MarvelRepository>(),
        loggerRepository: getIt.get<LoggerRepository>(),
      ),
    )
    ..registerFactory<GetCharacterDetailsUseCase>(
      () => GetCharacterDetailsUseCaseImpl(
        repository: getIt.get<MarvelRepository>(),
        loggerRepository: getIt.get<LoggerRepository>(),
      ),
    )
    ..registerFactory<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCaseImpl(
        repository: getIt.get<MarvelRepository>(),
        loggerRepository: getIt.get<LoggerRepository>(),
      ),
    )
    ..registerFactory<ToggleCharacterFavoriteUseCase>(
      () => ToggleCharacterFavoriteUseCaseImpl(
        repository: getIt.get<MarvelRepository>(),
        loggerRepository: getIt.get<LoggerRepository>(),
      ),
    );
}
