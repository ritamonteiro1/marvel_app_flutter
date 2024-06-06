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
}
