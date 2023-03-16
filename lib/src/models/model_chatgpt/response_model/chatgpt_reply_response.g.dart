// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatgpt_reply_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGPTResponse _$ChatGPTResponseFromJson(Map<String, dynamic> json) =>
    ChatGPTResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..errorMessage = json['errorMessage'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$ChatGPTResponseToJson(ChatGPTResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      text: json['text'] as String?,
      index: json['index'] as int?,
      logprobs: json['logprobs'] as int?,
      finishReason: json['finishReason'] as String?,
    )
      ..statusCode = json['statusCode'] as int?
      ..errorMessage = json['errorMessage'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'text': instance.text,
      'index': instance.index,
      'logprobs': instance.logprobs,
      'finishReason': instance.finishReason,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: json['promptTokens'] as int?,
      completionTokens: json['completionTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    )
      ..statusCode = json['statusCode'] as int?
      ..errorMessage = json['errorMessage'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };
