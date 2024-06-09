import 'package:app/src/domain/repository/marvel_repository.dart';
import 'package:app/src/domain/use_case/get_character_list/get_character_list_use_case.dart';
import 'package:app/src/domain/use_case/get_character_list/get_character_list_use_case_impl.dart';
import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../resources/test_resources.dart';
import 'get_character_list_use_case_impl_test.mocks.dart';

@GenerateMocks([MarvelRepository, LoggerRepository])
void main() {
  late MockMarvelRepository repository;
  late MockLoggerRepository loggerRepository;
  late GetCharacterListUseCase useCase;

  setUp(() {
    repository = MockMarvelRepository();
    loggerRepository = MockLoggerRepository();
    useCase = GetCharacterListUseCaseImpl(
      repository: repository,
      loggerRepository: loggerRepository,
    );
  });

  test(
      'GIVEN a call '
      'WHEN use case is called '
      'THEN repository should calls once', () async {
    when(repository.getCharacterList(page: 1)).thenAnswer(
      (_) async => TestResources.characterList,
    );
    await useCase.call(page: 1);
    verify(repository.getCharacterList(page: 1)).called(1);
  });
  test(
      'GIVEN a call '
      'WHEN repository returns a list'
      'THEN use case should returns the list with the same length', () async {
    when(repository.getCharacterList(page: 1)).thenAnswer(
      (_) async => TestResources.characterList,
    );
    final characterData = await useCase.call(page: 1);
    expect(characterData.characterList.length, 1);
  });
}
