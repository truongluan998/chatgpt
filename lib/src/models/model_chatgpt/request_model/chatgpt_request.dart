import 'package:json_annotation/json_annotation.dart';
import 'package:rest_utils/rest_utils.dart';

import '../../../constants/app_constants.dart';

part 'chatgpt_request.g.dart';

@JsonSerializable()
class ChatGPTRequest extends BaseRequestModel {
  String? model;

  String? prompt;

  double? temperature;

  @JsonKey(name: 'max_tokens')
  int? maxTokens;

  ChatGPTRequest({
    this.model = AppConstants.defaultModel,
    this.prompt,
    this.temperature = AppConstants.defaultTemperature,
    this.maxTokens = AppConstants.defaultMaxTokens,
  });

  factory ChatGPTRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTRequestFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ChatGPTRequestToJson(this);
}
