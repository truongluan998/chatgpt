import 'package:battery/baterry.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/blocs/battery/check_battery_cubit.dart';
import 'package:mock_project/src/blocs/battery/check_battery_state.dart';
import 'package:mocktail/mocktail.dart';

class MockBatteryPluginImp extends Mock implements BatteryImp {}

Future<void> main() async {
  late MockBatteryPluginImp batteryImp;

  late CheckBatteryCubit checkBatteryCubit;

  final exception = Exception('Some error');

  setUp(() {
    batteryImp = MockBatteryPluginImp();
    checkBatteryCubit = CheckBatteryCubit(batteryImp);
  });

  tearDown(() {
    checkBatteryCubit.close();
  });

  blocTest<CheckBatteryCubit, CheckBatteryState>(
    'emits veryLowBattery state when battery level is <= 10 and discharging',
    build: () {
      when(() => batteryImp.getBatteryLevel()).thenAnswer((_) => Future.value(10));
      when(() => batteryImp.batteryState()).thenAnswer((_) => Future.value(BatteryState.discharging));
      when(() => batteryImp.isInBatterySaveMode()).thenAnswer((_) async => false);
      return checkBatteryCubit;
    },
    act: (cubit) => cubit.checkBattery(),
    wait: const Duration(seconds: 3),
    expect: () => [
      const CheckBatteryState.batteryInitial(),
      const CheckBatteryState.veryLowBattery(),
    ],
  );

  blocTest<CheckBatteryCubit, CheckBatteryState>(
    'emits lowBattery state when battery level is <= 20 and discharging',
    build: () {
      when(() => batteryImp.getBatteryLevel()).thenAnswer((_) => Future.value(20));
      when(() => batteryImp.batteryState()).thenAnswer((_) => Future.value(BatteryState.discharging));
      when(() => batteryImp.isInBatterySaveMode()).thenAnswer((_) async => false);
      return checkBatteryCubit;
    },
    act: (cubit) => cubit.checkBattery(),
    wait: const Duration(seconds: 3),
    expect: () => [
      const CheckBatteryState.batteryInitial(),
      const CheckBatteryState.lowBattery(),
    ],
  );

  blocTest<CheckBatteryCubit, CheckBatteryState>(
    'emits highBattery state when battery level is == 80 and charging',
    build: () {
      when(() => batteryImp.getBatteryLevel()).thenAnswer((_) => Future.value(80));
      when(() => batteryImp.batteryState()).thenAnswer((_) => Future.value(BatteryState.charging));
      when(() => batteryImp.isInBatterySaveMode()).thenAnswer((_) async => false);
      return checkBatteryCubit;
    },
    act: (cubit) => cubit.checkBattery(),
    wait: const Duration(seconds: 3),
    expect: () => [
      const CheckBatteryState.batteryInitial(),
      const CheckBatteryState.highBattery(),
    ],
  );

  blocTest<CheckBatteryCubit, CheckBatteryState>(
    'emits fullBattery state when battery level is == 100 and charging',
    build: () {
      when(() => batteryImp.getBatteryLevel()).thenAnswer((_) => Future.value(100));
      when(() => batteryImp.batteryState()).thenAnswer((_) => Future.value(BatteryState.full));
      when(() => batteryImp.isInBatterySaveMode()).thenAnswer((_) async => false);
      return checkBatteryCubit;
    },
    act: (cubit) => cubit.checkBattery(),
    wait: const Duration(seconds: 3),
    expect: () => [
      const CheckBatteryState.batteryInitial(),
      const CheckBatteryState.fullBattery(),
    ],
  );

  blocTest<CheckBatteryCubit, CheckBatteryState>(
    'emits normal state when battery level is normal',
    build: () {
      when(() => batteryImp.getBatteryLevel()).thenAnswer((_) => Future.value(70));
      when(() => batteryImp.batteryState()).thenAnswer((_) => Future.value(BatteryState.discharging));
      when(() => batteryImp.isInBatterySaveMode()).thenAnswer((_) async => false);
      return checkBatteryCubit;
    },
    act: (cubit) => cubit.checkBattery(),
    wait: const Duration(seconds: 3),
    expect: () => [
      const CheckBatteryState.batteryInitial(),
      const CheckBatteryState.normalBattery(),
    ],
  );
}
