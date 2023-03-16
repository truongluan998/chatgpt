// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_model_chatgpt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModelResponse _$ListModelResponseFromJson(Map<String, dynamic> json) =>
    ListModelResponse(
      object: json['object'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..errorMessage = json['errorMessage'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$ListModelResponseToJson(ListModelResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'object': instance.object,
      'data': instance.data,
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      id: json['id'] as String?,
      created: json['created'] as int?,
      root: json['root'] as String?,
    )
      ..statusCode = json['statusCode'] as int?
      ..errorMessage = json['errorMessage'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'id': instance.id,
      'created': instance.created,
      'root': instance.root,
    };
