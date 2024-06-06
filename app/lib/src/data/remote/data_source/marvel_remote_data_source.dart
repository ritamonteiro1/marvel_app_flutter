import '../../../domain/model/character_list.dart';

abstract interface class MarvelRemoteDataSource {
  Future<CharacterList> getCharacterList({required int page});
}
