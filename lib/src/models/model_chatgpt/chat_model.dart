
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';


@JsonSerializable()
class Message {
  final String? text;
  final String? sender;
  final String? timestamp;

  const Message({
    this.text,
    this.sender,
    this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  Message.fromSnapshot(DocumentSnapshot snapshot)
      : text = snapshot.get('text'),
        sender = snapshot.get('sender'),
        timestamp = snapshot.get('timestamp');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          timestamp == other.timestamp;

  @override
  int get hashCode => timestamp.hashCode;
}

