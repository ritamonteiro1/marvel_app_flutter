import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/exceptions/marvel_exceptions.dart';
import '../../../domain/model/character_details_data.dart';
import '../../../domain/use_case/get_character_details/get_character_details_use_case.dart';
import '../../../domain/use_case/toggle_character_favorite/toggle_character_favorite_use_case.dart';
import 'character_details_event.dart';
import 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final GetCharacterDetailsUseCase _getCharacterDetailsUseCase;
  final ToggleCharacterFavoriteUseCase _toggleCharacterFavoriteUseCase;

  CharacterDetailsBloc({
    required GetCharacterDetailsUseCase getCharacterDetailsUseCase,
    required ToggleCharacterFavoriteUseCase toggleCharacterFavoriteUseCase,
  })  : _getCharacterDetailsUseCase = getCharacterDetailsUseCase,
        _toggleCharacterFavoriteUseCase = toggleCharacterFavoriteUseCase,
        super(InitialState()) {
    on<RequestCharacterDetails>(_requestDetails);
    on<TryRequestDetailsAgain>(_tryRequestDetailsAgain);
    on<ToggleFavoriteCharacter>(_toggleFavoriteCharacter);
  }

  late CharacterDetailsData characterDetails;

  Future<void> _requestDetails(
    RequestCharacterDetails event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    try {
      characterDetails = await _getCharacterDetailsUseCase.call(
        characterId: event.characterId,
      );
      emit(SuccessRequestingDetails(character: characterDetails));
    } catch (e) {
      _handleErrorRequestingDetails(e, emit);
    }
  }

  Future<void> _tryRequestDetailsAgain(
    TryRequestDetailsAgain event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    emit(TryRequestingDetailsAgain());
    try {
      characterDetails = await _getCharacterDetailsUseCase.call(
        characterId: event.characterId,
      );
      emit(SuccessRequestingDetails(character: characterDetails));
    } catch (e) {
      _handleErrorRequestingDetails(e, emit);
    }
  }

  Future<void> _toggleFavoriteCharacter(
    ToggleFavoriteCharacter event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    await _toggleCharacterFavoriteUseCase.call(character: event.character);
    characterDetails.isFavorite = !characterDetails.isFavorite;
    emit(SuccessRequestingDetails(character: characterDetails));
  }

  void _handleErrorRequestingDetails(
    Object e,
    Emitter<CharacterDetailsState> emit,
  ) {
    if (e is NetworkErrorException) {
      emit(NetworkErrorRequestingDetails());
    } else {
      emit(GenericErrorRequestingDetails());
    }
  }
}
