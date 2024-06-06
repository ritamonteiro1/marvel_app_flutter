import 'package:hive/hive.dart';

import '../../../domain/model/character_details_data.dart';
import '../../mapper/marvel_mapper.dart';
import '../model/character_cache.dart';
import 'marvel_local_data_source.dart';

class MarvelLocalDataSourceImpl implements MarvelLocalDataSource {
  final MarvelMapper _mapper;
  final HiveInterface _hive;

  MarvelLocalDataSourceImpl({
    required MarvelMapper mapper,
    required HiveInterface hive,
  })  : _mapper = mapper,
        _hive = hive;

  @override
  Future<List<CharacterDetailsData>> getFavoriteCharacters() async {
    final box = await _hive.openBox(_favoriteBoxName);
    final characterListCache = List<CharacterCache>.from(box.values);
    return characterListCache
        .map((characterCache) => _mapper.characterCacheToDomain(
              character: characterCache,
            ))
        .toList();
  }

  @override
  Future<void> removeCharacter({required int characterId}) async {
    final box = await _hive.openBox(_favoriteBoxName);
    await box.delete(characterId);
  }

  @override
  Future<void> saveCharacter({required CharacterDetailsData character}) async {
    final box = await _hive.openBox(_favoriteBoxName);
    final characterCache = _mapper.characterDomainToCache(character: character);
    await box.put(characterCache.id, characterCache);
  }

  @override
  Future<bool> verifyIfCharacterIsFavorite({required int characterId}) async {
    final box = await _hive.openBox(_favoriteBoxName);
    if (box.containsKey(characterId)) {
      return true;
    }
    return false;
  }
}

const _favoriteBoxName = 'favoriteCharacters';
