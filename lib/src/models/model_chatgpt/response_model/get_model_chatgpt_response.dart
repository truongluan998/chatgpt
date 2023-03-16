import 'package:json_annotation/json_annotation.dart';
import 'package:rest_utils/rest_utils.dart';

part 'get_model_chatgpt_response.g.dart';

@JsonSerializable()
class ListModelResponse extends BaseResponseModel{
  String? object;
  final List<Model>? data;

  ListModelResponse({
    this.object,
    this.data,
  });

  factory ListModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ListModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelResponseToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => ListModelResponse.fromJson(json);
}

@JsonSerializable()
class Model extends BaseResponseModel {
  final String? id;
  final int? created;
  final String? root;

  Model({
    this.id,
    this.created,
    this.root,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Model.fromJson(json);
}
