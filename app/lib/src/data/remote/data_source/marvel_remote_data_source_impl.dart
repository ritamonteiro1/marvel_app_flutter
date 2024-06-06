import 'dart:convert' as convert;

import 'package:core/core.dart';
import 'package:http/http.dart' as http;

import '../../../domain/model/character_details_data.dart';
import '../../../domain/model/character_list.dart';
import '../../mapper/marvel_mapper.dart';
import '../model/marvel_data_response.dart';
import 'api_constants/marvel_api_constants.dart';
import 'environment/marvel_environment.dart';
import 'marvel_remote_data_source.dart';

class MarvelRemoteDataSourceImpl implements MarvelRemoteDataSource {
  final MarvelMapper _mapper;

  MarvelRemoteDataSourceImpl({
    required MarvelMapper mapper,
  }) : _mapper = mapper;

  @override
  Future<CharacterList> getCharacterList({required int page}) async {
    const limitPerPage = 20;
    final offset = (page == 1) ? 0 : (limitPerPage * page);
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

      final result = await http.get(uri);
      var jsonResponse =
          convert.jsonDecode(result.body) as Map<String, dynamic>;
      final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
      return _mapper.characterListResponseToDomain(response: marvelResponse);
    } catch (e) {
      throw Exception();
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

      final result = await http.get(uri);
      var jsonResponse =
          convert.jsonDecode(result.body) as Map<String, dynamic>;
      final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
      return _mapper.characterDetailsResponseToDomain(response: marvelResponse);
    } catch (e) {
      throw Exception();
    }
  }
}
