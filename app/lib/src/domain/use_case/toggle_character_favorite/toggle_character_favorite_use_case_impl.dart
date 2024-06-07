import '../../model/character_details_data.dart';
import '../../repository/marvel_repository.dart';
import 'toggle_character_favorite_use_case.dart';

class ToggleCharacterFavoriteUseCaseImpl
    implements ToggleCharacterFavoriteUseCase {
  final MarvelRepository _repository;

  ToggleCharacterFavoriteUseCaseImpl({
    required MarvelRepository repository,
  }) : _repository = repository;

  @override
  Future<void> call({required CharacterDetailsData character}) async {
    await _repository.toggleFavoriteCharacter(character: character);
  }
}
