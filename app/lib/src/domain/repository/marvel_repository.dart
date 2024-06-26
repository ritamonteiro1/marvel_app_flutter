import '../model/character_details_data.dart';
import '../model/character_list.dart';

abstract interface class MarvelRepository {
  Future<CharacterList> getCharacterList({
    required int page,
  });

  Future<CharacterDetailsData> getCharacterDetails({
    required int characterId,
  });

  Future<List<CharacterDetailsData>> getFavoriteCharacters();

  Future<void> toggleFavoriteCharacter({
    required CharacterDetailsData character,
  });
}
