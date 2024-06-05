// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarvelResponse _$MarvelResponseFromJson(Map<String, dynamic> json) =>
    MarvelResponse(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      characterList: (json['results'] as List<dynamic>)
          .map((e) => CharacterResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarvelResponseToJson(MarvelResponse instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.characterList,
    };
