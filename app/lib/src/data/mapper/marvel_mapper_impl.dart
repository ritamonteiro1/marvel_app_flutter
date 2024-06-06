import '../../domain/model/character_data.dart';
import '../../domain/model/character_details_data.dart';
import '../../domain/model/character_list.dart';
import '../remote/model/marvel_data_response.dart';
import 'marvel_mapper.dart';

class MarvelMapperImpl implements MarvelMapper {
  @override
  CharacterList characterListResponseToDomain({
    required MarvelDataResponse response,
  }) {
    final data = response.data;
    return CharacterList(
      offset: data.offset,
      limit: data.limit,
      total: data.total,
      count: data.count,
      characterList: data.characterList.map(
        (character) {
          return CharacterData(
            id: character.id,
            name: character.name,
            description: character.description,
            modified: character.modified,
            imageUrl:
                '${character.thumbnail.path}.${character.thumbnail.extension}',
            comics: character.comics.items.map((item) => item.name).toList(),
          );
        },
      ).toList(),
    );
  }

  @override
  CharacterDetailsData characterDetailsResponseToDomain({
    required MarvelDataResponse response,
  }) {
    final data = response.data;
    return data.characterList
        .map((character) {
          return CharacterDetailsData(
            id: character.id,
            name: character.name,
            description: character.description,
            modified: character.modified,
            imageUrl:
                '${character.thumbnail.path}.${character.thumbnail.extension}',
            comics: character.comics.items.map((item) => item.name).toList(),
          );
        })
        .toList()
        .first;
  }
}
