import '../../domain/model/character_list.dart';
import '../remote/model/marvel_data_response.dart';

abstract interface class MarvelMapper {
  CharacterList toDomain({required MarvelDataResponse response});
}
