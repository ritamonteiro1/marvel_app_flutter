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
    on<TryRequestCharacterListAgain>(_tryRequestCharacterListAgain);
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
      await _requestCharacters(emit);
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
      await _requestMoreCharacters(emit);
    } catch (e) {
      _handleErrorRequestingMoreCharacters(e, emit);
    }
  }

  Future<void> _requestMoreCharacters(Emitter<HomeState> emit) async {
    final charactersResult = await _getCharacterListUseCase.call(
      page: _characterListPage,
    );
    _characterVerticalList.addAll(charactersResult.characterList);
    _characterListPage++;
    if (charactersResult.offset == charactersResult.total) {
      _hasFinishedPage = true;
    }
    emit(SuccessRequestingCharacters(
      characterHorizontalList: _characterHorizontalList,
      characterVerticalList: _characterVerticalList,
      isLoadingMore: false,
    ));
  }

  Future<void> _tryRequestCharacterListAgain(
    TryRequestCharacterListAgain event,
    Emitter<HomeState> emit,
  ) async {
    emit(TryRequestingCharactersAgain());
    try {
      await _requestCharacters(emit);
    } catch (e) {
      _handleErrorRequestingCharacters(e, emit);
    }
  }

  Future<void> _requestCharacters(Emitter<HomeState> emit) async {
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
