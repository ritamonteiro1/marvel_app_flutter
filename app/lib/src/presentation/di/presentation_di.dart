import 'package:get_it/get_it.dart';

import '../bloc/home/home_bloc.dart';

void presentationDI() {
  final getIt = GetIt.instance;
  getIt.registerFactory(() => HomeBloc(
        getCharacterListUseCase: getIt.get(),
      ));
}
