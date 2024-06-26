// Mocks generated by Mockito 5.4.4 from annotations
// in app/test/src/data/repository/marvel_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:app/src/data/local/data_source/marvel_local_data_source.dart'
    as _i6;
import 'package:app/src/data/remote/data_source/marvel_remote_data_source.dart'
    as _i4;
import 'package:app/src/domain/model/character_details_data.dart' as _i3;
import 'package:app/src/domain/model/character_list.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCharacterList_0 extends _i1.SmartFake implements _i2.CharacterList {
  _FakeCharacterList_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCharacterDetailsData_1 extends _i1.SmartFake
    implements _i3.CharacterDetailsData {
  _FakeCharacterDetailsData_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MarvelRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarvelRemoteDataSource extends _i1.Mock
    implements _i4.MarvelRemoteDataSource {
  MockMarvelRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.CharacterList> getCharacterList({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacterList,
          [],
          {#page: page},
        ),
        returnValue: _i5.Future<_i2.CharacterList>.value(_FakeCharacterList_0(
          this,
          Invocation.method(
            #getCharacterList,
            [],
            {#page: page},
          ),
        )),
      ) as _i5.Future<_i2.CharacterList>);

  @override
  _i5.Future<_i3.CharacterDetailsData> getCharacterDetails(
          {required int? characterId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacterDetails,
          [],
          {#characterId: characterId},
        ),
        returnValue: _i5.Future<_i3.CharacterDetailsData>.value(
            _FakeCharacterDetailsData_1(
          this,
          Invocation.method(
            #getCharacterDetails,
            [],
            {#characterId: characterId},
          ),
        )),
      ) as _i5.Future<_i3.CharacterDetailsData>);
}

/// A class which mocks [MarvelLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarvelLocalDataSource extends _i1.Mock
    implements _i6.MarvelLocalDataSource {
  MockMarvelLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.CharacterDetailsData>> getFavoriteCharacters() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteCharacters,
          [],
        ),
        returnValue: _i5.Future<List<_i3.CharacterDetailsData>>.value(
            <_i3.CharacterDetailsData>[]),
      ) as _i5.Future<List<_i3.CharacterDetailsData>>);

  @override
  _i5.Future<void> saveCharacter(
          {required _i3.CharacterDetailsData? character}) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCharacter,
          [],
          {#character: character},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> removeCharacter({required int? characterId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeCharacter,
          [],
          {#characterId: characterId},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<bool> verifyIfCharacterIsFavorite({required int? characterId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyIfCharacterIsFavorite,
          [],
          {#characterId: characterId},
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
