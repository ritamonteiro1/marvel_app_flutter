// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_comics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterComicsResponse _$CharacterComicsResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterComicsResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              CharacterComicsItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterComicsResponseToJson(
        CharacterComicsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
