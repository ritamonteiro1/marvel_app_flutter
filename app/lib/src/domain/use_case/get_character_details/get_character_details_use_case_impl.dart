import '../../model/character_details_data.dart';
import '../../repository/marvel_repository.dart';
import 'get_character_details_use_case.dart';

class GetCharacterDetailsUseCaseImpl implements GetCharacterDetailsUseCase {
  final MarvelRepository _repository;

  GetCharacterDetailsUseCaseImpl({
    required MarvelRepository repository,
  }) : _repository = repository;

  @override
  Future<CharacterDetailsData> call({required int characterId}) async {
    return await _repository.getCharacterDetails(characterId: characterId);
  }
}
