import '../../model/character_details_data.dart';

abstract interface class GetCharacterDetailsUseCase {
  Future<CharacterDetailsData> call({required int characterId});
}
