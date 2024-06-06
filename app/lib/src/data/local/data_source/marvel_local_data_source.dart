import '../../../domain/model/character_details_data.dart';

abstract interface class MarvelLocalDataSource {
  Future<List<CharacterDetailsData>> getFavoriteCharacters();

  Future<void> saveCharacter({required CharacterDetailsData character});

  Future<void> removeCharacter({required int characterId});

  Future<bool> verifyIfCharacterIsFavorite({required int characterId});
}
