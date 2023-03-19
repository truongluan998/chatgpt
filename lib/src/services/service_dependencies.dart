import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_utils/rest_utils.dart';

import 'chatgpt/chatgpt_service.dart';
import 'firebase/auth/auth_service.dart';
import 'firebase/auth/auth_service_impl.dart';
import 'firebase/fcm/nofitication_service.dart';
import 'firebase/fcm/notification_service_imp.dart';

class ServiceDependencies {
  static void init(GetIt injector) {
    injector.registerLazySingleton(
      () => ChatGPTService(
        injector.get<RestUtil>(instanceName: 'CHATGPTAPI'),
      ),
    );
    injector.registerLazySingleton<AuthService>(
      () => AuthServiceImpl(
        injector(),
      ),
    );
    injector.registerLazySingleton<NotificationService>(
      () => NotificationServiceImp(
        injector(),
      ),
    );
  }
}
