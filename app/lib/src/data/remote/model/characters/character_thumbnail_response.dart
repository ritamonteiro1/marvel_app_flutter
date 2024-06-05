import 'package:json_annotation/json_annotation.dart';

part 'character_thumbnail_response.g.dart';

@JsonSerializable()
class CharacterThumbnailResponse {
  final String path;
  final String extension;

  CharacterThumbnailResponse({
    required this.path,
    required this.extension,
  });

  factory CharacterThumbnailResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterThumbnailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterThumbnailResponseToJson(this);
}
