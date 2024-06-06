import '../../model/character_details_data.dart';

abstract interface class GetFavoriteCharactersUseCase {
  Future<List<CharacterDetailsData>> call();
}
