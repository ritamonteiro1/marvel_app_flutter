import '../../domain/model/character_details_data.dart';
import '../../domain/model/character_list.dart';
import '../local/model/character_cache.dart';
import '../remote/model/marvel_data_response.dart';

abstract interface class MarvelMapper {
  CharacterList characterListResponseToDomain({
    required MarvelDataResponse response,
  });

  CharacterDetailsData characterDetailsResponseToDomain({
    required MarvelDataResponse response,
  });

  CharacterCache characterDomainToCache({
    required CharacterDetailsData character,
  });

  CharacterDetailsData characterCacheToDomain({
    required CharacterCache character,
  });
}
