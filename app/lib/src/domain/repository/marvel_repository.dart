import '../model/character_list.dart';

abstract interface class MarvelRepository {
  Future<CharacterList> getCharacterList({required int page});
}
