import '../../domain/model/character_details_data.dart';
import '../../domain/model/character_list.dart';
import '../../domain/repository/marvel_repository.dart';
import '../local/data_source/marvel_local_data_source.dart';
import '../remote/data_source/marvel_remote_data_source.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  final MarvelLocalDataSource _localDataSource;
  final MarvelRemoteDataSource _remoteDataSource;

  MarvelRepositoryImpl({
    required MarvelLocalDataSource localDataSource,
    required MarvelRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<CharacterList> getCharacterList({required int page}) async {
    return await _remoteDataSource.getCharacterList(page: page);
  }

  @override
  Future<CharacterDetailsData> getCharacterDetails({
    required int characterId,
  }) async {
    final character = await _remoteDataSource.getCharacterDetails(
      characterId: characterId,
    );
    character.isFavorite = await _localDataSource.verifyIfCharacterIsFavorite(
      characterId: characterId,
    );
    return character;
  }

  @override
  Future<List<CharacterDetailsData>> getFavoriteCharacters() async {
    return await _localDataSource.getFavoriteCharacters();
  }
}
