import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/model_chatgpt/chat_model.dart';
part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.chatInitial() = ChatInitial;
  const factory ChatState.chatLoading() = ChatLoading;
  const factory ChatState.chatLoaded(List<Message> messages, String id) = ChatLoaded;
  const factory ChatState.chatError(String message) = ChatError;
}
