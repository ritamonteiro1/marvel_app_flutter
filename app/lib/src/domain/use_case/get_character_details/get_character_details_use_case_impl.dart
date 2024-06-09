import 'package:core/core.dart';

import '../../model/character_details_data.dart';
import '../../repository/marvel_repository.dart';
import 'get_character_details_use_case.dart';

class GetCharacterDetailsUseCaseImpl implements GetCharacterDetailsUseCase {
  final MarvelRepository _repository;
  final LoggerRepository _loggerRepository;

  GetCharacterDetailsUseCaseImpl({
    required MarvelRepository repository,
    required LoggerRepository loggerRepository,
  })  : _repository = repository,
        _loggerRepository = loggerRepository;

  @override
  Future<CharacterDetailsData> call({required int characterId}) async {
    _loggerRepository.d('Requesting character details for id $characterId');
    try {
      final details =
          await _repository.getCharacterDetails(characterId: characterId);
      _loggerRepository
          .d('Character details for id $characterId retrieved successfully');
      return details;
    } catch (e) {
      _loggerRepository.e(
          'Error requesting character details for id $characterId', e);
      rethrow;
    }
  }
}
