import 'package:json_annotation/json_annotation.dart';

import 'character_comics_item_response.dart';

part 'character_comics_response.g.dart';

@JsonSerializable()
class CharacterComicsResponse {
  final CharacterComicsItemResponse items;

  CharacterComicsResponse({
    required this.items,
  });

  factory CharacterComicsResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterComicsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterComicsResponseToJson(this);
}
