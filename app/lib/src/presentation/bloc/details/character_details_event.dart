import '../../../domain/model/character_details_data.dart';

sealed class CharacterDetailsEvent {}

class RequestCharacterDetails extends CharacterDetailsEvent {
  final int characterId;

  RequestCharacterDetails({
    required this.characterId,
  });
}

class TryRequestDetailsAgain extends CharacterDetailsEvent {
  final int characterId;

  TryRequestDetailsAgain({
    required this.characterId,
  });
}

class ToggleFavoriteCharacter extends CharacterDetailsEvent {
  final CharacterDetailsData character;

  ToggleFavoriteCharacter({
    required this.character,
  });
}
