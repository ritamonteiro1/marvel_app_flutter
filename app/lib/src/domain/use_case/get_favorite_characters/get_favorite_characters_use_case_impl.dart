import 'package:core/core.dart';

import '../../model/character_details_data.dart';
import '../../repository/marvel_repository.dart';
import 'get_favorite_characters_use_case.dart';

class GetFavoriteCharactersUseCaseImpl implements GetFavoriteCharactersUseCase {
  final MarvelRepository _repository;
  final LoggerRepository _loggerRepository;

  GetFavoriteCharactersUseCaseImpl({
    required MarvelRepository repository,
    required LoggerRepository loggerRepository,
  })  : _repository = repository,
        _loggerRepository = loggerRepository;

  @override
  Future<List<CharacterDetailsData>> call() async {
    _loggerRepository.d('Requesting favorite characters');
    try {
      final favorites = await _repository.getFavoriteCharacters();
      _loggerRepository.d('Favorite characters retrieved successfully');
      return favorites;
    } catch (e) {
      _loggerRepository.e('Error requesting favorite characters', e);
      rethrow;
    }
  }
}
