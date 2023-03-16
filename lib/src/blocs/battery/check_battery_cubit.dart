import 'dart:async';

import 'package:battery/baterry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_battery_state.dart';

class CheckBatteryCubit extends Cubit<CheckBatteryState> {
  CheckBatteryCubit(this._batteryPluginImp) : super(const CheckBatteryState.batteryInitial());

  final BatteryImp _batteryPluginImp;

  late Timer _timer;

  Future<void> checkBattery() async {
    try {
      _timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
        emit(const CheckBatteryState.batteryInitial());
        final batteryLevel = await _batteryPluginImp.getBatteryLevel();
        final batteryState = await _batteryPluginImp.batteryState();

        if (batteryLevel != null && batteryLevel <= 10 && batteryState == BatteryState.discharging) {
          emit(const CheckBatteryState.veryLowBattery());
          final isSaveMode = await _batteryPluginImp.isInBatterySaveMode();
          if (!isSaveMode) {
            /// TODO: call battery save mode
          }
        } else if (batteryLevel != null && batteryLevel <= 20 && batteryState == BatteryState.discharging) {
          emit(const CheckBatteryState.lowBattery());
        } else if (batteryLevel != null && batteryLevel == 80 && batteryState == BatteryState.charging) {
          emit(const CheckBatteryState.highBattery());
        } else if (batteryState == BatteryState.full) {
          emit(const CheckBatteryState.fullBattery());
        } else {
          emit(const CheckBatteryState.normalBattery());
        }
      });
    } on Exception catch (e) {
      emit(CheckBatteryState.errorBattery(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
