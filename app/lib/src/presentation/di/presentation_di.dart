import 'package:app/src/presentation/bloc/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

void presentationDI() {
  final getIt = GetIt.instance;
  getIt.registerFactory(() => HomeBloc(
        getCharacterListUseCase: getIt.get(),
      ));
}
