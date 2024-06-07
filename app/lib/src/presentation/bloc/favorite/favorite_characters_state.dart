import '../../../domain/model/character_details_data.dart';

sealed class FavoriteCharactersState {}

class InitialState extends FavoriteCharactersState {}

class SuccessfullyRequestingFavorites extends FavoriteCharactersState {
  final List<CharacterDetailsData> characters;

  SuccessfullyRequestingFavorites({
    required this.characters,
  });
}

class GenericErrorRequestingFavorites extends FavoriteCharactersState {}

class TryRequestingFavoritesAgain extends FavoriteCharactersState {}
