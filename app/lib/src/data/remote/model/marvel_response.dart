import 'package:json_annotation/json_annotation.dart';

import 'characters/character_response.dart';

part 'marvel_response.g.dart';

@JsonSerializable()
class MarvelResponse {
  final int offset;
  final int limit;
  final int total;
  final int count;
  @JsonKey(name: 'results')
  final List<CharacterResponse> characterList;

  MarvelResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.characterList,
  });

  factory MarvelResponse.fromJson(Map<String, dynamic> json) =>
      _$MarvelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarvelResponseToJson(this);
}
