import 'dart:convert' as convert;
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../domain/exceptions/marvel_exceptions.dart';
import '../../../domain/model/character_details_data.dart';
import '../../../domain/model/character_list.dart';
import '../../mapper/marvel_mapper.dart';
import '../model/marvel_data_response.dart';
import 'api_constants/marvel_api_constants.dart';
import 'environment/marvel_environment.dart';
import 'marvel_remote_data_source.dart';

class MarvelRemoteDataSourceImpl implements MarvelRemoteDataSource {
  final MarvelMapper _mapper;
  final http.Client _httpClient;

  MarvelRemoteDataSourceImpl({
    required MarvelMapper mapper,
    required http.Client httpClient,
  })  : _mapper = mapper,
        _httpClient = httpClient;

  @override
  Future<CharacterList> getCharacterList({required int page}) async {
    const limitPerPage = 20;
    final offset = (page == 1) ? 0 : (limitPerPage * (page - 1));
    final queryParameterTimestamp = DateTime.now().generateTimestamp();
    final hash = (queryParameterTimestamp +
            MarvelEnvironment.privateApiKey +
            MarvelEnvironment.publicApiKey)
        .generateHash();

    try {
      final uri = Uri.https(
        MarvelApiConstants.baseUrl,
        MarvelApiConstants.endpointCharacterList,
        {
          'ts': queryParameterTimestamp,
          'apikey': MarvelEnvironment.publicApiKey,
          'hash': hash,
          'limit': limitPerPage.toString(),
          'offset': offset.toString(),
        },
      );

      final result = await _httpClient.get(uri);
      var jsonResponse =
          convert.jsonDecode(result.body) as Map<String, dynamic>;
      final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
      return _mapper.characterListResponseToDomain(response: marvelResponse);
    } catch (e) {
      if (e is SocketException) {
        throw NetworkErrorException();
      }
      throw GenericErrorException();
    }
  }

  @override
  Future<CharacterDetailsData> getCharacterDetails({
    required int characterId,
  }) async {
    final queryParameterTimestamp = DateTime.now().generateTimestamp();
    final hash = (queryParameterTimestamp +
            MarvelEnvironment.privateApiKey +
            MarvelEnvironment.publicApiKey)
        .generateHash();

    try {
      final uri = Uri.https(
        MarvelApiConstants.baseUrl,
        '${MarvelApiConstants.endpointCharacterList}/$characterId',
        {
          'ts': queryParameterTimestamp,
          'apikey': MarvelEnvironment.publicApiKey,
          'hash': hash,
        },
      );

      final result = await _httpClient.get(uri);
      var jsonResponse =
          convert.jsonDecode(result.body) as Map<String, dynamic>;
      final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
      return _mapper.characterDetailsResponseToDomain(response: marvelResponse);
    } catch (e) {
      if (e is SocketException) {
        throw NetworkErrorException();
      }
      throw GenericErrorException();
    }
  }
}

// class MarvelRemoteDataSourceImpl implements MarvelRemoteDataSource {
//   final MarvelMapper _mapper;
//   final http.Client _httpClient;
//
//   MarvelRemoteDataSourceImpl({
//     required MarvelMapper mapper,
//     required http.Client httpClient,
//   })  : _mapper = mapper,
//         _httpClient = httpClient;
//
//   @override
//   Future<CharacterList> getCharacterList({required int page}) async {
//     const filePath = 'assets/mock/character_list_mock.json';
//     try {
//       final jsonString = await rootBundle.loadString(filePath);
//       final jsonResponse = convert.jsonDecode(jsonString);
//       final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
//       await Future.delayed(const Duration(seconds: 3));
//       return _mapper.characterListResponseToDomain(response: marvelResponse);
//     } catch (e) {
//       if (e is SocketException) {
//         throw NetworkErrorException();
//       }
//       throw GenericErrorException();
//     }
//   }
//
//   @override
//   Future<CharacterDetailsData> getCharacterDetails({
//     required int characterId,
//   }) async {
//     const filePath = 'assets/mock/character_details_mock.json';
//     try {
//       final jsonString = await rootBundle.loadString(filePath);
//       final jsonResponse = convert.jsonDecode(jsonString);
//       final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
//       await Future.delayed(const Duration(seconds: 3));
//       return _mapper.characterDetailsResponseToDomain(response: marvelResponse);
//     } catch (e) {
//       if (e is SocketException) {
//         throw NetworkErrorException();
//       }
//       throw GenericErrorException();
//     }
//   }
// }
