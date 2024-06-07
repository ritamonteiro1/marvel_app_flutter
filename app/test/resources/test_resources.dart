import 'package:app/src/domain/model/character_data.dart';
import 'package:app/src/domain/model/character_details_data.dart';
import 'package:app/src/domain/model/character_list.dart';

abstract class TestResources {
  static CharacterData characterData = CharacterData(
    id: 1,
    name: 'name',
    description: 'description',
    modified: 'modified',
    imageUrl: 'imageUrl',
    comics: [],
  );

  static CharacterList characterList = CharacterList(
    offset: 0,
    limit: 20,
    total: 1000,
    count: 20,
    characterList: [
      characterData,
    ],
  );

  static CharacterDetailsData characterDetails = CharacterDetailsData(
    id: 1,
    name: 'name',
    description: 'description',
    modified: 'modified',
    imageUrl: 'imageUrl',
    comics: [],
  );

  static CharacterDetailsData favoriteCharacterDetails = CharacterDetailsData(
    id: 1,
    name: 'name',
    description: 'description',
    modified: 'modified',
    imageUrl: 'imageUrl',
    comics: [],
    isFavorite: true,
  );

  static List<CharacterDetailsData> emptyFavoriteCharacterList = [];

  static List<CharacterDetailsData> favoriteCharacterList = [
    characterDetails,
  ];
}
