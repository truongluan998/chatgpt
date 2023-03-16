import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.connectivityInitial() = ConnectivityInitial;
  const factory ConnectivityState.connectivityLost() = ConnectivityLost;
  const factory ConnectivityState.connectivityConnect() = ConnectivityConnect;
  const factory ConnectivityState.connectivityError({String? message}) = ConnectivityError;
}
