import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_favorite_characters/get_favorite_characters_use_case.dart';
import 'favorite_characters_event.dart';
import 'favorite_characters_state.dart';

class FavoriteCharactersBloc
    extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  final GetFavoriteCharactersUseCase _getFavoriteCharactersUseCase;

  FavoriteCharactersBloc({
    required GetFavoriteCharactersUseCase getFavoriteCharactersUseCase,
  })  : _getFavoriteCharactersUseCase = getFavoriteCharactersUseCase,
        super(InitialState()) {
    on<RequestFavoriteCharacters>(_requestFavoriteCharacters);
    on<TryRequestFavoriteCharactersAgain>(_tryRequestFavoritesAgain);
  }

  Future<void> _requestFavoriteCharacters(
    RequestFavoriteCharacters event,
    Emitter<FavoriteCharactersState> emit,
  ) async {
    try {
      await _requestFavorites(emit);
    } catch (e) {
      emit(GenericErrorRequestingFavorites());
    }
  }

  Future<void> _requestFavorites(
    Emitter<FavoriteCharactersState> emit,
  ) async {
    final characters = await _getFavoriteCharactersUseCase.call();
    emit(SuccessfullyRequestingFavorites(characters: characters));
  }

  Future<void> _tryRequestFavoritesAgain(
    TryRequestFavoriteCharactersAgain event,
    Emitter<FavoriteCharactersState> emit,
  ) async {
    emit(TryRequestingFavoritesAgain());
    try {
      await _requestFavorites(emit);
    } catch (e) {
      emit(GenericErrorRequestingFavorites());
    }
  }
}
