import '../../../domain/model/character_details_data.dart';

sealed class CharacterDetailsState {}

class InitialState extends CharacterDetailsState {}

class SuccessRequestingDetails extends CharacterDetailsState {
  final CharacterDetailsData character;

  SuccessRequestingDetails({
    required this.character,
  });
}

class GenericErrorRequestingDetails extends CharacterDetailsState {}

class NetworkErrorRequestingDetails extends CharacterDetailsState {}

class TryRequestingDetailsAgain extends CharacterDetailsState {}
