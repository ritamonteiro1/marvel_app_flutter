// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarvelDataResponse _$MarvelDataResponseFromJson(Map<String, dynamic> json) =>
    MarvelDataResponse(
      code: (json['code'] as num).toInt(),
      data: MarvelResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarvelDataResponseToJson(MarvelDataResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
