import '../../model/character_list.dart';

abstract interface class GetCharacterListUseCase {
  Future<CharacterList> call({required int page});
}
