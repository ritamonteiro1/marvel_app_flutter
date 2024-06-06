import '../../../domain/model/character_details_data.dart';
import '../../../domain/model/character_list.dart';

abstract interface class MarvelRemoteDataSource {
  Future<CharacterList> getCharacterList({required int page});

  Future<CharacterDetailsData> getCharacterDetails({required int characterId});
}
