import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit(this._connectivityImp) : super(const ConnectivityState.connectivityInitial());

  final ConnectivityImp _connectivityImp;

  Future<void> checkConnectivity() async {
    try {
      emit(const ConnectivityState.connectivityInitial());
      final connectionStatus = await _connectivityImp.checkConnectivity();
      if ((connectionStatus == ConnectivityResult.wifi) ||
          (connectionStatus == ConnectivityResult.ethernet) ||
          (connectionStatus == ConnectivityResult.mobile)) {
        emit(const ConnectivityState.connectivityConnect());
      } else {
        emit(const ConnectivityState.connectivityLost());
      }
    } on Exception catch (e) {
      emit(ConnectivityState.connectivityError(message: e.toString()));
    }
  }
}
