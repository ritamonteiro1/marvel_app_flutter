import 'package:flutter_bloc/flutter_bloc.dart';

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
        super(InitialState());
}
