import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_battery_state.freezed.dart';

@freezed
class CheckBatteryState with _$CheckBatteryState {
  const factory CheckBatteryState.batteryInitial() = CheckBatteryInitial;
  const factory CheckBatteryState.veryLowBattery() = VeryLowBattery;
  const factory CheckBatteryState.lowBattery() = LowBattery;
  const factory CheckBatteryState.normalBattery() = NormalBattery;
  const factory CheckBatteryState.highBattery() = HighBattery;
  const factory CheckBatteryState.fullBattery() = FullBattery;
  const factory CheckBatteryState.errorBattery({String? message}) = CheckBatteryError;
}
