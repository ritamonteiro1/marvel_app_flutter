import '../../domain/model/character_details_data.dart';
import '../../domain/model/character_list.dart';
import '../remote/model/marvel_data_response.dart';

abstract interface class MarvelMapper {
  CharacterList characterListResponseToDomain({
    required MarvelDataResponse response,
  });

  CharacterDetailsData characterDetailsResponseToDomain({
    required MarvelDataResponse response,
  });
}
