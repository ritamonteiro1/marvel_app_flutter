import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  Future<void> _requestCharacterList(
    RequestCharacterList event,
    Emitter<HomeState> emit,
  ) async {
    await _getCharacterListUseCase.call(page: 1);
  }
}
