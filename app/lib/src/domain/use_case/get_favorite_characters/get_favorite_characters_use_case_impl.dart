import '../../model/character_details_data.dart';
import '../../repository/marvel_repository.dart';
import 'get_favorite_characters_use_case.dart';

class GetFavoriteCharactersUseCaseImpl implements GetFavoriteCharactersUseCase {
  final MarvelRepository _repository;

  GetFavoriteCharactersUseCaseImpl({
    required MarvelRepository repository,
  }) : _repository = repository;

  @override
  Future<List<CharacterDetailsData>> call() async {
    return await _repository.getFavoriteCharacters();
  }
}
