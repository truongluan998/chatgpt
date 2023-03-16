// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInitial,
    required TResult Function() chatLoading,
    required TResult Function(List<Message> messages, String id) chatLoaded,
    required TResult Function(String message) chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInitial,
    TResult? Function()? chatLoading,
    TResult? Function(List<Message> messages, String id)? chatLoaded,
    TResult? Function(String message)? chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInitial,
    TResult Function()? chatLoading,
    TResult Function(List<Message> messages, String id)? chatLoaded,
    TResult Function(String message)? chatError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitial value) chatInitial,
    required TResult Function(ChatLoading value) chatLoading,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatError value) chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitial value)? chatInitial,
    TResult? Function(ChatLoading value)? chatLoading,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatError value)? chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitial value)? chatInitial,
    TResult Function(ChatLoading value)? chatLoading,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatError value)? chatError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatInitialCopyWith<$Res> {
  factory _$$ChatInitialCopyWith(
          _$ChatInitial value, $Res Function(_$ChatInitial) then) =
      __$$ChatInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatInitialCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatInitial>
    implements _$$ChatInitialCopyWith<$Res> {
  __$$ChatInitialCopyWithImpl(
      _$ChatInitial _value, $Res Function(_$ChatInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatInitial implements ChatInitial {
  const _$ChatInitial();

  @override
  String toString() {
    return 'ChatState.chatInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInitial,
    required TResult Function() chatLoading,
    required TResult Function(List<Message> messages, String id) chatLoaded,
    required TResult Function(String message) chatError,
  }) {
    return chatInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInitial,
    TResult? Function()? chatLoading,
    TResult? Function(List<Message> messages, String id)? chatLoaded,
    TResult? Function(String message)? chatError,
  }) {
    return chatInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInitial,
    TResult Function()? chatLoading,
    TResult Function(List<Message> messages, String id)? chatLoaded,
    TResult Function(String message)? chatError,
    required TResult orElse(),
  }) {
    if (chatInitial != null) {
      return chatInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitial value) chatInitial,
    required TResult Function(ChatLoading value) chatLoading,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatError value) chatError,
  }) {
    return chatInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitial value)? chatInitial,
    TResult? Function(ChatLoading value)? chatLoading,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatError value)? chatError,
  }) {
    return chatInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitial value)? chatInitial,
    TResult Function(ChatLoading value)? chatLoading,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatError value)? chatError,
    required TResult orElse(),
  }) {
    if (chatInitial != null) {
      return chatInitial(this);
    }
    return orElse();
  }
}

abstract class ChatInitial implements ChatState {
  const factory ChatInitial() = _$ChatInitial;
}

/// @nodoc
abstract class _$$ChatLoadingCopyWith<$Res> {
  factory _$$ChatLoadingCopyWith(
          _$ChatLoading value, $Res Function(_$ChatLoading) then) =
      __$$ChatLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatLoadingCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatLoading>
    implements _$$ChatLoadingCopyWith<$Res> {
  __$$ChatLoadingCopyWithImpl(
      _$ChatLoading _value, $Res Function(_$ChatLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatLoading implements ChatLoading {
  const _$ChatLoading();

  @override
  String toString() {
    return 'ChatState.chatLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInitial,
    required TResult Function() chatLoading,
    required TResult Function(List<Message> messages, String id) chatLoaded,
    required TResult Function(String message) chatError,
  }) {
    return chatLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInitial,
    TResult? Function()? chatLoading,
    TResult? Function(List<Message> messages, String id)? chatLoaded,
    TResult? Function(String message)? chatError,
  }) {
    return chatLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInitial,
    TResult Function()? chatLoading,
    TResult Function(List<Message> messages, String id)? chatLoaded,
    TResult Function(String message)? chatError,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitial value) chatInitial,
    required TResult Function(ChatLoading value) chatLoading,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatError value) chatError,
  }) {
    return chatLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitial value)? chatInitial,
    TResult? Function(ChatLoading value)? chatLoading,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatError value)? chatError,
  }) {
    return chatLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitial value)? chatInitial,
    TResult Function(ChatLoading value)? chatLoading,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatError value)? chatError,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading(this);
    }
    return orElse();
  }
}

abstract class ChatLoading implements ChatState {
  const factory ChatLoading() = _$ChatLoading;
}

/// @nodoc
abstract class _$$ChatLoadedCopyWith<$Res> {
  factory _$$ChatLoadedCopyWith(
          _$ChatLoaded value, $Res Function(_$ChatLoaded) then) =
      __$$ChatLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> messages, String id});
}

/// @nodoc
class __$$ChatLoadedCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatLoaded>
    implements _$$ChatLoadedCopyWith<$Res> {
  __$$ChatLoadedCopyWithImpl(
      _$ChatLoaded _value, $Res Function(_$ChatLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? id = null,
  }) {
    return _then(_$ChatLoaded(
      null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatLoaded implements ChatLoaded {
  const _$ChatLoaded(final List<Message> messages, this.id)
      : _messages = messages;

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String id;

  @override
  String toString() {
    return 'ChatState.chatLoaded(messages: $messages, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatLoaded &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messages), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatLoadedCopyWith<_$ChatLoaded> get copyWith =>
      __$$ChatLoadedCopyWithImpl<_$ChatLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInitial,
    required TResult Function() chatLoading,
    required TResult Function(List<Message> messages, String id) chatLoaded,
    required TResult Function(String message) chatError,
  }) {
    return chatLoaded(messages, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInitial,
    TResult? Function()? chatLoading,
    TResult? Function(List<Message> messages, String id)? chatLoaded,
    TResult? Function(String message)? chatError,
  }) {
    return chatLoaded?.call(messages, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInitial,
    TResult Function()? chatLoading,
    TResult Function(List<Message> messages, String id)? chatLoaded,
    TResult Function(String message)? chatError,
    required TResult orElse(),
  }) {
    if (chatLoaded != null) {
      return chatLoaded(messages, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitial value) chatInitial,
    required TResult Function(ChatLoading value) chatLoading,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatError value) chatError,
  }) {
    return chatLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitial value)? chatInitial,
    TResult? Function(ChatLoading value)? chatLoading,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatError value)? chatError,
  }) {
    return chatLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitial value)? chatInitial,
    TResult Function(ChatLoading value)? chatLoading,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatError value)? chatError,
    required TResult orElse(),
  }) {
    if (chatLoaded != null) {
      return chatLoaded(this);
    }
    return orElse();
  }
}

abstract class ChatLoaded implements ChatState {
  const factory ChatLoaded(final List<Message> messages, final String id) =
      _$ChatLoaded;

  List<Message> get messages;
  String get id;
  @JsonKey(ignore: true)
  _$$ChatLoadedCopyWith<_$ChatLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatErrorCopyWith<$Res> {
  factory _$$ChatErrorCopyWith(
          _$ChatError value, $Res Function(_$ChatError) then) =
      __$$ChatErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ChatErrorCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatError>
    implements _$$ChatErrorCopyWith<$Res> {
  __$$ChatErrorCopyWithImpl(
      _$ChatError _value, $Res Function(_$ChatError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ChatError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatError implements ChatError {
  const _$ChatError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatState.chatError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatErrorCopyWith<_$ChatError> get copyWith =>
      __$$ChatErrorCopyWithImpl<_$ChatError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInitial,
    required TResult Function() chatLoading,
    required TResult Function(List<Message> messages, String id) chatLoaded,
    required TResult Function(String message) chatError,
  }) {
    return chatError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInitial,
    TResult? Function()? chatLoading,
    TResult? Function(List<Message> messages, String id)? chatLoaded,
    TResult? Function(String message)? chatError,
  }) {
    return chatError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInitial,
    TResult Function()? chatLoading,
    TResult Function(List<Message> messages, String id)? chatLoaded,
    TResult Function(String message)? chatError,
    required TResult orElse(),
  }) {
    if (chatError != null) {
      return chatError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitial value) chatInitial,
    required TResult Function(ChatLoading value) chatLoading,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatError value) chatError,
  }) {
    return chatError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitial value)? chatInitial,
    TResult? Function(ChatLoading value)? chatLoading,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatError value)? chatError,
  }) {
    return chatError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitial value)? chatInitial,
    TResult Function(ChatLoading value)? chatLoading,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatError value)? chatError,
    required TResult orElse(),
  }) {
    if (chatError != null) {
      return chatError(this);
    }
    return orElse();
  }
}

abstract class ChatError implements ChatState {
  const factory ChatError(final String message) = _$ChatError;

  String get message;
  @JsonKey(ignore: true)
  _$$ChatErrorCopyWith<_$ChatError> get copyWith =>
      throw _privateConstructorUsedError;
}
