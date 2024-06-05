import 'package:json_annotation/json_annotation.dart';

import 'character_comics_response.dart';
import 'character_thumbnail_response.dart';

part 'character_response.g.dart';

@JsonSerializable()
class CharacterResponse {
  final int id;
  final String name;
  final String description;
  final String modified;
  final CharacterThumbnailResponse thumbnail;
  final CharacterComicsResponse comics;

  CharacterResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.comics,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}
