// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatgpt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGPTRequest _$ChatGPTRequestFromJson(Map<String, dynamic> json) =>
    ChatGPTRequest(
      model: json['model'] as String? ?? AppConstants.defaultModel,
      prompt: json['prompt'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble() ??
          AppConstants.defaultTemperature,
      maxTokens: json['max_tokens'] as int? ?? AppConstants.defaultMaxTokens,
    );

Map<String, dynamic> _$ChatGPTRequestToJson(ChatGPTRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'temperature': instance.temperature,
      'max_tokens': instance.maxTokens,
    };
