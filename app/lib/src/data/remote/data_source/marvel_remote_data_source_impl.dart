import 'dart:convert' as convert;

import 'package:core/core.dart';
import 'package:http/http.dart' as http;

import '../../../domain/model/character_list.dart';
import '../../../utils/marvel_environment.dart';
import '../../mapper/marvel_mapper.dart';
import '../model/marvel_data_response.dart';
import 'api_constants/marvel_api_constants.dart';
import 'marvel_remote_data_source.dart';

class MarvelRemoteDataSourceImpl implements MarvelRemoteDataSource {
  final MarvelMapper mapper;

  MarvelRemoteDataSourceImpl({
    required this.mapper,
  });

  @override
  Future<CharacterList> getCharacterList() async {
    const queryParameterTimestamp = '1';
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
          'hash': hash
        },
      );

      final result = await http.get(uri);
      var jsonResponse =
          convert.jsonDecode(result.body) as Map<String, dynamic>;
      final marvelResponse = MarvelDataResponse.fromJson(jsonResponse);
      return mapper.toDomain(response: marvelResponse);
    } catch (e) {
      throw Exception();
    }
  }
}
