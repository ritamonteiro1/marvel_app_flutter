import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/exceptions/marvel_exceptions.dart';
import '../../../domain/model/character_data.dart';
import '../../../domain/use_case/get_character_list/get_character_list_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharacterListUseCase _getCharacterListUseCase;

  HomeBloc({
    required GetCharacterListUseCase getCharacterListUseCase,
  })  : _getCharacterListUseCase = getCharacterListUseCase,
        super(InitialState()) {
    on<RequestCharacterList>(_requestCharacterList);
    on<RequestMoreCharacterList>(_requestMoreCharacterList);
  }

  int _characterListPage = 1;
  bool _hasFinishedPage = false;
  final List<CharacterData> _characterHorizontalList = [];
  final List<CharacterData> _characterVerticalList = [];
  static const _characterHorizontalListLength = 5;

  Future<void> _requestCharacterList(
    RequestCharacterList event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final charactersResult = await _getCharacterListUseCase.call(
        page: _characterListPage,
      );
      final characters = charactersResult.characterList;
      _characterHorizontalList.addAll(characters.sublist(
        0,
        _characterHorizontalListLength,
      ));
      _characterVerticalList.addAll(characters.sublist(
        _characterHorizontalListLength,
      ));
      _characterListPage++;
      emit(SuccessRequestingCharacters(
        characterHorizontalList: _characterHorizontalList,
        characterVerticalList: _characterVerticalList,
      ));
    } catch (e) {
      _handleErrorRequestingCharacters(e, emit);
    }
  }

  Future<void> _requestMoreCharacterList(
    RequestMoreCharacterList event,
    Emitter<HomeState> emit,
  ) async {
    if (_hasFinishedPage) {
      emit(SuccessRequestingCharacters(
        characterHorizontalList: _characterHorizontalList,
        characterVerticalList: _characterVerticalList,
        hasFinishedPages: _hasFinishedPage,
      ));
      return;
    }
    emit(SuccessRequestingCharacters(
      characterHorizontalList: _characterHorizontalList,
      characterVerticalList: _characterVerticalList,
      isLoadingMore: true,
    ));
    try {
      final charactersResult = await _getCharacterListUseCase.call(
        page: _characterListPage,
      );
      _characterVerticalList.addAll(charactersResult.characterList);
      _characterListPage++;
      _checkIfPagesAreFinished(
        totalCharactersCurrently: charactersResult.offset,
        totalCharacters: charactersResult.total,
      );
      emit(SuccessRequestingCharacters(
        characterHorizontalList: _characterHorizontalList,
        characterVerticalList: _characterVerticalList,
        isLoadingMore: false,
      ));
    } catch (e) {
      _handleErrorRequestingMoreCharacters(e, emit);
    }
  }

  void _checkIfPagesAreFinished({
    required int totalCharactersCurrently,
    required int totalCharacters,
  }) {
    if (totalCharactersCurrently == totalCharacters) {
      _hasFinishedPage = true;
    }
  }

  void _handleErrorRequestingCharacters(Object e, Emitter<HomeState> emit) {
    if (e is NetworkErrorException) {
      emit(NetworkErrorRequestingCharacters());
    } else {
      emit(GenericErrorRequestingCharacters());
    }
  }

  void _handleErrorRequestingMoreCharacters(Object e, Emitter<HomeState> emit) {
    if (e is NetworkErrorException) {
      emit(SuccessRequestingCharacters(
        characterHorizontalList: _characterHorizontalList,
        characterVerticalList: _characterVerticalList,
        isLoadingMore: false,
        hasNetworkErrorRequestingMore: true,
      ));
    } else {
      emit(SuccessRequestingCharacters(
        characterHorizontalList: _characterHorizontalList,
        characterVerticalList: _characterVerticalList,
        isLoadingMore: false,
        hasGenericErrorRequestingMore: true,
      ));
    }
  }
}
