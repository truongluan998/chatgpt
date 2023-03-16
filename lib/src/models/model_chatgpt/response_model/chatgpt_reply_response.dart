import 'package:json_annotation/json_annotation.dart';
import 'package:rest_utils/rest_utils.dart';

part 'chatgpt_reply_response.g.dart';

@JsonSerializable()
class ChatGPTResponse extends BaseResponseModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  ChatGPTResponse(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage,});

  factory ChatGPTResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTResponseToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => ChatGPTResponse.fromJson(json);
}

@JsonSerializable()
class Choices extends BaseResponseModel {
  String? text;
  int? index;
  int? logprobs;
  String? finishReason;

  Choices({this.text, this.index, this.logprobs, this.finishReason});

  factory Choices.fromJson(Map<String, dynamic> json) =>
      _$ChoicesFromJson(json);

  Map<String, dynamic> toJson() => _$ChoicesToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Choices.fromJson(json);
}

@JsonSerializable()
class Usage extends BaseResponseModel {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Usage.fromJson(json);
}
