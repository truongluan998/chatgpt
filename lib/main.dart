import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';

import 'firebase_options.dart';
import 'src/app_dependencies.dart';
import 'src/chatgpt.dart';
import 'src/constants/app_constants.dart';
import 'src/services/firebase/fcm/nofitication_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GlobalConfiguration().loadFromAsset('server_settings');
  final result = await AppDependencies.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final notificationService = AppDependencies.injector.get<NotificationService>();
  await notificationService.initializeFCM();
  if (result) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then(
      (_) => runApp(
        EasyLocalization(
          supportedLocales: AppConstants.listLanguageSupport,
          path: AppConstants.localizationAssetPath,
          fallbackLocale: AppConstants.listLanguageSupport[0],
          child: const ChatGPT(),
        ),
      ),
    );
  }
}
