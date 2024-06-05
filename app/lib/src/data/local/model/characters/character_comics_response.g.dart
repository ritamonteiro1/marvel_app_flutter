// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_comics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterComicsResponse _$CharacterComicsResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterComicsResponse(
      items: CharacterComicsItemResponse.fromJson(
          json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterComicsResponseToJson(
        CharacterComicsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
