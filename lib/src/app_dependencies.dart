import 'package:battery/baterry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_utils/rest_utils.dart';

import 'blocs/bloc_dependencies.dart';
import 'models/model_dependencies.dart';
import 'routes/app_router.dart';
import 'routes/auth_guard.dart';
import 'services/service_dependencies.dart';
import 'utils/app_configuration.dart';
import 'utils/network/interceptor.dart';
import 'utils/show_toast.dart';
import 'utils/validator.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;

  static Future<bool> initialize() async {
    injector.registerLazySingleton<AppConfiguration>(() => AppConfiguration());
    injector.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
    injector.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    injector.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
    final config = AppDependencies.injector.get<AppConfiguration>();
    injector.registerLazySingleton<RestUtil>(
      () => RestUtil(
        config.chatgptBaseUrl,
        interceptors: [ChatGPTInterceptor()],
      ),
      instanceName: 'CHATGPTAPI',
    );
    injector.registerLazySingleton<AuthGuard>(() => AuthGuard());
    injector.registerLazySingleton<AppRouter>(
      () => AppRouter(authGuard: AuthGuard()),
    );
    injector.registerLazySingleton<BatteryImp>(() => BatteryImp());
    injector.registerLazySingleton<ConnectivityImp>(() => ConnectivityImp());
    injector.registerFactory(() => ShowToast());
    injector.registerFactory(() => Validator());
    ModelDependencies.init(injector);
    ServiceDependencies.init(injector);
    BlocDependencies.init(injector);
    return true;
  }
}
