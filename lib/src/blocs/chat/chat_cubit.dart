import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_constants.dart';
import '../../models/model_chatgpt/chat_model.dart';
import '../../services/chatgpt/chatgpt_service.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._chatGPTService,
    this._databaseReference,
    this._currentUser,
  ) : super(const ChatState.chatInitial());

  final FirebaseFirestore _databaseReference;
  final ChatGPTService _chatGPTService;
  final FirebaseAuth _currentUser;

  final List<Message> _listMessage = [];
  dynamic _endItem;
  var _size = 0;

  Future<void> loadMessages({bool? isLoadFirstTime}) async {
    if (isLoadFirstTime ?? false) {
      _size = await getSizeMessageSnapshot();
    }
    try {
      emit(const ChatState.chatLoading());
      if (_listMessage.isEmpty) {
        final messagesSnapshot = await _databaseReference
            .collection(FirestoreConstants.pathMessageCollection)
            .doc(_currentUser.currentUser?.uid ?? '')
            .collection(FirestoreConstants.chatWithGPT)
            .orderBy(FirestoreConstants.timestamp, descending: true)
            .limit(_size >= 20 ? 20 : _size)
            .get();
        _listMessage.addAll(messagesSnapshot.docs.map(Message.fromSnapshot).toList());
        _endItem = messagesSnapshot.docs.last;
        _size >= 20 ? _size -= 20 : _size -= _size;
        emit(ChatState.chatLoaded(_listMessage, _currentUser.currentUser?.uid ?? ''));
      } else {
        if (_size > 0) {
          final messagesSnapshot = await _databaseReference
              .collection(FirestoreConstants.pathMessageCollection)
              .doc(_currentUser.currentUser?.uid ?? '')
              .collection(FirestoreConstants.chatWithGPT)
              .orderBy(FirestoreConstants.timestamp, descending: true)
              .startAfterDocument(_endItem)
              .limit(_size >= 20 ? 20 : _size)
              .get();
          _listMessage.addAll(messagesSnapshot.docs.map(Message.fromSnapshot).toList());
          _endItem = messagesSnapshot.docs.last;
          _size >= 20 ? _size -= 20 : _size -= _size;
          emit(ChatState.chatLoaded(_listMessage, _currentUser.currentUser?.uid ?? ''));
        }
      }
    } on Exception catch (e) {
      emit(ChatState.chatError(e.toString()));
    }
  }

  Future<int> getSizeMessageSnapshot() => _databaseReference
      .collection(FirestoreConstants.pathMessageCollection)
      .doc(_currentUser.currentUser?.uid ?? '')
      .collection(FirestoreConstants.chatWithGPT)
      .orderBy(FirestoreConstants.timestamp, descending: true)
      .get()
      .then((value) => value.size);

  Future<void> listenToMessages() async {
    _databaseReference
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(_currentUser.currentUser?.uid ?? '')
        .collection(FirestoreConstants.chatWithGPT)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .snapshots()
        .listen((snapshot) {
      final messages = snapshot.docs.map(Message.fromSnapshot).toList();
      emit(ChatState.chatLoaded(messages, _currentUser.currentUser?.uid ?? ''));
    });
  }

  Future<void> addMessage(String content) async {
    try {
      final message = Message(
        text: content,
        sender: _currentUser.currentUser?.uid ?? '',
        timestamp: DateTime.now().toIso8601String(),
      );
      await _databaseReference
          .collection(FirestoreConstants.pathMessageCollection)
          .doc(_currentUser.currentUser?.uid ?? '')
          .collection(FirestoreConstants.chatWithGPT)
          .add(message.toJson())
          .whenComplete(() => _size++);
      await listenToMessageChatGPT(content);
    } on Exception catch (e) {
      emit(ChatState.chatError(e.toString()));
    }
  }

  Future<void> listenToMessageChatGPT(String content) async {
    try {
      final response = await _chatGPTService.chatWithChatGPT(prompt: content);
      final message = Message(
        text: response.choices!.first.text,
        sender: FirestoreConstants.botSender,
        timestamp: DateTime.now().toIso8601String(),
      );
      await _databaseReference
          .collection(FirestoreConstants.pathMessageCollection)
          .doc(_currentUser.currentUser?.uid ?? '')
          .collection(FirestoreConstants.chatWithGPT)
          .add(message.toJson())
          .whenComplete(() => _size++);
    } on Exception catch (e) {
      emit(ChatState.chatError(e.toString()));
    }
  }
}
