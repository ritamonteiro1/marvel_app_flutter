import 'package:app/src/domain/repository/marvel_repository.dart';
import 'package:app/src/domain/use_case/get_character_details/get_character_details_use_case.dart';
import 'package:app/src/domain/use_case/get_character_details/get_character_details_use_case_impl.dart';
import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../resources/test_resources.dart';
import 'get_character_details_use_case_impl_test.mocks.dart';

@GenerateMocks([MarvelRepository, LoggerRepository])
void main() {
  late MockMarvelRepository repository;
  late MockLoggerRepository loggerRepository;
  late GetCharacterDetailsUseCase useCase;

  setUp(() {
    repository = MockMarvelRepository();
    loggerRepository = MockLoggerRepository();
    useCase = GetCharacterDetailsUseCaseImpl(
      repository: repository,
      loggerRepository: loggerRepository,
    );
  });

  test(
      'GIVEN a call '
      'WHEN use case is called '
      'THEN repository should calls once', () async {
    when(repository.getCharacterDetails(characterId: 1)).thenAnswer(
      (_) async => TestResources.characterDetails,
    );
    await useCase.call(characterId: 1);
    verify(repository.getCharacterDetails(characterId: 1)).called(1);
  });
  test(
      'GIVEN a call '
      'WHEN use case calls with characterId equals 1'
      'THEN repository should returns a character with the same id', () async {
    when(repository.getCharacterDetails(characterId: 1)).thenAnswer(
      (_) async => TestResources.characterDetails,
    );
    final characterDetails = await useCase.call(characterId: 1);
    expect(characterDetails.id, 1);
  });
}
