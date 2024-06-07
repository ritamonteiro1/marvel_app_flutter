import '../../../domain/model/character_data.dart';

sealed class HomeState {}

class InitialState extends HomeState {}

class SuccessRequestingCharacters extends HomeState {
  final List<CharacterData> characterHorizontalList;
  final List<CharacterData> characterVerticalList;
  bool isLoadingMore;
  bool hasNetworkErrorRequestingMore;
  bool hasGenericErrorRequestingMore;
  bool hasFinishedPages;

  SuccessRequestingCharacters({
    required this.characterHorizontalList,
    required this.characterVerticalList,
    this.isLoadingMore = false,
    this.hasNetworkErrorRequestingMore = false,
    this.hasGenericErrorRequestingMore = false,
    this.hasFinishedPages = false,
  });
}

class GenericErrorRequestingCharacters extends HomeState {}

class NetworkErrorRequestingCharacters extends HomeState {}
