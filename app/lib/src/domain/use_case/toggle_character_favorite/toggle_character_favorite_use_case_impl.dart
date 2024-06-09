import 'package:core/core.dart';

import '../../model/character_details_data.dart';
import '../../repository/marvel_repository.dart';
import 'toggle_character_favorite_use_case.dart';

class ToggleCharacterFavoriteUseCaseImpl
    implements ToggleCharacterFavoriteUseCase {
  final MarvelRepository _repository;
  final LoggerRepository _loggerRepository;

  ToggleCharacterFavoriteUseCaseImpl({
    required MarvelRepository repository,
    required LoggerRepository loggerRepository,
  })  : _repository = repository,
        _loggerRepository = loggerRepository;

  @override
  Future<void> call({required CharacterDetailsData character}) async {
    _loggerRepository.d('Toggling favorite character ${character.id}');
    try {
      await _repository.toggleFavoriteCharacter(character: character);
      _loggerRepository.d('Favorite character ${character.id} toggled');
    } catch (e) {
      _loggerRepository.e(
          'Error toggling favorite character ${character.id}', e);
      rethrow;
    }
  }
}
