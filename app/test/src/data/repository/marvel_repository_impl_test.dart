import 'package:app/src/data/local/data_source/marvel_local_data_source.dart';
import 'package:app/src/data/remote/data_source/marvel_remote_data_source.dart';
import 'package:app/src/data/repository/marvel_repository_impl.dart';
import 'package:app/src/domain/exceptions/marvel_exceptions.dart';
import 'package:app/src/domain/repository/marvel_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../resources/test_resources.dart';
import 'marvel_repository_impl_test.mocks.dart';

@GenerateMocks([MarvelRemoteDataSource, MarvelLocalDataSource])
void main() {
  late MockMarvelRemoteDataSource mockRemoteDataSource;
  late MockMarvelLocalDataSource mockLocalDataSource;
  late MarvelRepository repository;

  setUp(() {
    mockRemoteDataSource = MockMarvelRemoteDataSource();
    mockLocalDataSource = MockMarvelLocalDataSource();
    repository = MarvelRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('getCharacterList', () {
    test(
        'GIVEN a call '
        'WHEN repository is called '
        'THEN remote data source should calls once', () async {
      when(mockRemoteDataSource.getCharacterList(page: 1)).thenAnswer(
        (_) async => TestResources.characterList,
      );
      await repository.getCharacterList(page: 1);
      verify(mockRemoteDataSource.getCharacterList(page: 1)).called(1);
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called with page equals 1 '
        'THEN repository should returns offset equals 0', () async {
      when(mockRemoteDataSource.getCharacterList(page: 1)).thenAnswer(
        (_) async => TestResources.characterList,
      );
      final characters = await repository.getCharacterList(page: 1);
      expect(characters.offset, 0);
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called with page equals 1 '
        'THEN repository should returns limit equals 20', () async {
      when(mockRemoteDataSource.getCharacterList(page: 2)).thenAnswer(
        (_) async => TestResources.characterList,
      );
      final characters = await repository.getCharacterList(page: 2);
      expect(characters.limit, 20);
    });
    test(
        'GIVEN a call '
        'WHEN remote data source returns a list '
        'THEN repository should returns a list with same length', () async {
      when(mockRemoteDataSource.getCharacterList(page: 2)).thenAnswer(
        (_) async => TestResources.characterList,
      );
      final characters = await repository.getCharacterList(page: 2);
      expect(characters.characterList.length, 1);
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called and throws NetworkErrorException '
        'THEN repository should throws NetworkErrorException', () async {
      when(mockRemoteDataSource.getCharacterList(page: 1))
          .thenThrow(NetworkErrorException());
      expect(() => repository.getCharacterList(page: 1),
          throwsA(isA<NetworkErrorException>()));
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called and throws GenericErrorException '
        'THEN repository should throws GenericErrorException', () async {
      when(mockRemoteDataSource.getCharacterList(page: 1))
          .thenThrow(GenericErrorException());
      expect(() => repository.getCharacterList(page: 1),
          throwsA(isA<GenericErrorException>()));
    });
  });

  group('getCharacterDetails', () {
    test(
        'GIVEN a call '
        'WHEN repository is called '
        'THEN remote data source should calls once', () async {
      when(mockRemoteDataSource.getCharacterDetails(characterId: 1)).thenAnswer(
        (_) async => TestResources.characterDetails,
      );
      when(
        mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1),
      ).thenAnswer((_) async => false);
      await repository.getCharacterDetails(characterId: 1);
      verify(mockRemoteDataSource.getCharacterDetails(characterId: 1))
          .called(1);
    });
    test(
        'GIVEN a call '
        'WHEN repository is called '
        'THEN local data source should calls once', () async {
      when(mockRemoteDataSource.getCharacterDetails(characterId: 1)).thenAnswer(
        (_) async => TestResources.characterDetails,
      );
      when(
        mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1),
      ).thenAnswer((_) async => false);
      await repository.getCharacterDetails(characterId: 1);
      verify(mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1))
          .called(1);
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called with characterId equals 1 '
        'THEN repository should returns characterId equals 1', () async {
      when(mockRemoteDataSource.getCharacterDetails(characterId: 1)).thenAnswer(
        (_) async => TestResources.characterDetails,
      );
      when(
        mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1),
      ).thenAnswer((_) async => false);
      final characterDetails =
          await repository.getCharacterDetails(characterId: 1);
      expect(characterDetails.id, 1);
    });
    test(
        'GIVEN a call '
        'WHEN local data source returns that character is favorite '
        'THEN repository should returns favorite character ', () async {
      when(mockRemoteDataSource.getCharacterDetails(characterId: 1))
          .thenAnswer((_) async => TestResources.characterDetails);
      when(mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1))
          .thenAnswer((_) async => true);
      final characterDetails =
          await repository.getCharacterDetails(characterId: 1);
      expect(characterDetails.isFavorite, true);
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called and throws NetworkErrorException '
        'THEN repository should throws NetworkErrorException', () async {
      when(mockRemoteDataSource.getCharacterDetails(characterId: 1))
          .thenThrow(NetworkErrorException());
      when(mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1))
          .thenAnswer((_) async => true);
      expect(() => repository.getCharacterDetails(characterId: 1),
          throwsA(isA<NetworkErrorException>()));
    });
    test(
        'GIVEN a call '
        'WHEN remote data source is called and throws GenericErrorException '
        'THEN repository should throws GenericErrorException', () async {
      when(mockRemoteDataSource.getCharacterDetails(characterId: 1))
          .thenThrow(GenericErrorException());
      when(mockLocalDataSource.verifyIfCharacterIsFavorite(characterId: 1))
          .thenAnswer((_) async => true);
      expect(() => repository.getCharacterDetails(characterId: 1),
          throwsA(isA<GenericErrorException>()));
    });
  });

  group('getFavoriteCharacters', () {
    test(
        'GIVEN a call '
        'WHEN repository is called '
        'THEN local data source should calls once', () async {
      when(mockLocalDataSource.getFavoriteCharacters())
          .thenAnswer((_) async => TestResources.favoriteCharacterList);
      await repository.getFavoriteCharacters();
      verify(mockLocalDataSource.getFavoriteCharacters()).called(1);
    });
  });
  test(
      'GIVEN a call '
      'WHEN local data source is called and returns a empty list '
      'THEN repository should returns a empty list', () async {
    when(mockLocalDataSource.getFavoriteCharacters()).thenAnswer(
      (_) async => TestResources.emptyFavoriteCharacterList,
    );
    final favoriteList = await repository.getFavoriteCharacters();
    expect(favoriteList, []);
  });
  test(
      'GIVEN a call '
      'WHEN local data source is called and returns a list '
      'THEN repository should returns a list with same length', () async {
    when(mockLocalDataSource.getFavoriteCharacters()).thenAnswer(
      (_) async => TestResources.favoriteCharacterList,
    );
    final favoriteList = await repository.getFavoriteCharacters();
    expect(favoriteList.length, 1);
  });

  group('toggleFavoriteCharacter', () {
    test(
        'GIVEN a call '
        'WHEN repository is called and character is favorite'
        'THEN local data source to remove character should calls once',
        () async {
      when(mockLocalDataSource.removeCharacter(characterId: 1))
          .thenAnswer((_) async => _);
      await repository.toggleFavoriteCharacter(
        character: TestResources.favoriteCharacterDetails,
      );
      verify(mockLocalDataSource.removeCharacter(characterId: 1)).called(1);
    });
    test(
        'GIVEN a call '
        'WHEN repository is called and character is favorite'
        'THEN local data source to save character should not calls', () async {
      when(mockLocalDataSource.removeCharacter(characterId: 1))
          .thenAnswer((_) async => _);
      await repository.toggleFavoriteCharacter(
        character: TestResources.favoriteCharacterDetails,
      );
      verifyNever(mockLocalDataSource.saveCharacter(
        character: TestResources.favoriteCharacterDetails,
      ));
    });
  });
}
