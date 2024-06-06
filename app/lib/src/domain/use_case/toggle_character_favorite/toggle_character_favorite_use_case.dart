import '../../model/character_details_data.dart';

abstract interface class ToggleCharacterFavoriteUseCase {
  Future<void> call({required CharacterDetailsData character});
}
