import 'package:json_annotation/json_annotation.dart';

part 'character_comics_item_response.g.dart';

@JsonSerializable()
class CharacterComicsItemResponse {
  final String name;

  CharacterComicsItemResponse({
    required this.name,
  });

  factory CharacterComicsItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterComicsItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterComicsItemResponseToJson(this);
}
