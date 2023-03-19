import 'package:get_it/get_it.dart';

import 'authentication/authentication_cubit.dart';
import 'battery/check_battery_cubit.dart';
import 'chat/chat_cubit.dart';
import 'connectivity/connectivity_cubit.dart';

class BlocDependencies {
  static void init(GetIt injector) {
    injector.registerFactory(() => AuthenticationCubit(injector()));
    injector.registerFactory(
      () => ChatCubit(
        injector(),
        injector(),
        injector(),
      ),
    );
    injector.registerFactory(() => CheckBatteryCubit(injector()));
    injector.registerFactory(() => ConnectivityCubit(injector()));
  }
}
