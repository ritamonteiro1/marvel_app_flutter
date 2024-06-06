import '../../model/character_list.dart';
import '../../repository/marvel_repository.dart';
import 'get_character_list_use_case.dart';

class GetCharacterListUseCaseImpl implements GetCharacterListUseCase {
  final MarvelRepository _repository;

  GetCharacterListUseCaseImpl({
    required MarvelRepository repository,
  }) : _repository = repository;

  @override
  Future<CharacterList> call({required int page}) async {
    return await _repository.getCharacterList(page: page);
  }
}
