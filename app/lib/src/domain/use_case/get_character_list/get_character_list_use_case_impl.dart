import 'package:core/core.dart';

import '../../model/character_list.dart';
import '../../repository/marvel_repository.dart';
import 'get_character_list_use_case.dart';

class GetCharacterListUseCaseImpl implements GetCharacterListUseCase {
  final MarvelRepository _repository;
  final LoggerRepository _loggerRepository;

  GetCharacterListUseCaseImpl({
    required MarvelRepository repository,
    required LoggerRepository loggerRepository,
  })  : _repository = repository,
        _loggerRepository = loggerRepository;

  @override
  Future<CharacterList> call({required int page}) async {
    _loggerRepository.d('Requesting character list for page $page');
    try {
      final list = await _repository.getCharacterList(page: page);
      _loggerRepository
          .d('Character list for page $page retrieved successfully');
      return list;
    } catch (e) {
      _loggerRepository.e('Error requesting character list for page $page', e);
      rethrow;
    }
  }
}
