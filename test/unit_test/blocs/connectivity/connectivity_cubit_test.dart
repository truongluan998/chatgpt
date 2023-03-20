import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/blocs/connectivity/connectivity_cubit.dart';
import 'package:mock_project/src/blocs/connectivity/connectivity_state.dart';
import 'package:mocktail/mocktail.dart';

class MockConnectivityPluginImp extends Mock implements ConnectivityImp {}

Future<void> main() async {
  late MockConnectivityPluginImp connectivityPluginImp;

  late ConnectivityCubit connectivityCubit;

  setUp(() {
    connectivityPluginImp = MockConnectivityPluginImp();
    connectivityCubit = ConnectivityCubit(connectivityPluginImp);
  });

  tearDown(() => connectivityCubit.close());

  blocTest<ConnectivityCubit, ConnectivityState>(
    'emits connectivityConnect state when have ethernet',
    build: () {
      when(() => connectivityPluginImp.checkConnectivity()).thenAnswer((_) => Future.value(ConnectivityResult.mobile));
      return connectivityCubit;
    },
    act: (cubit) => cubit.checkConnectivity(),
    expect: () => [
      const ConnectivityState.connectivityInitial(),
      const ConnectivityState.connectivityConnect(),
    ],
  );

  blocTest<ConnectivityCubit, ConnectivityState>(
    'emits connectivityLost state when lost internet',
    build: () {
      when(() => connectivityPluginImp.checkConnectivity()).thenAnswer((_) => Future.value(ConnectivityResult.none));
      return connectivityCubit;
    },
    act: (cubit) => cubit.checkConnectivity(),
    expect: () => [
      const ConnectivityState.connectivityInitial(),
      const ConnectivityState.connectivityLost(),
    ],
  );

  blocTest<ConnectivityCubit, ConnectivityState>(
    'emits connectivityLost state when throw Exception',
    build: () {
      when(() => connectivityPluginImp.checkConnectivity()).thenThrow(Exception());
      return connectivityCubit;
    },
    act: (cubit) => cubit.checkConnectivity(),
    expect: () => [
      const ConnectivityState.connectivityInitial(),
      const ConnectivityState.connectivityError(message: 'Exception'),
    ],
  );
}
