import 'marvel_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marvel_data_response.g.dart';

@JsonSerializable()
class MarvelDataResponse {
  final int code;
  final MarvelResponse data;

  MarvelDataResponse({
    required this.code,
    required this.data,
  });

  factory MarvelDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MarvelDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarvelDataResponseToJson(this);
}
