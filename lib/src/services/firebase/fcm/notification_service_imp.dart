import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../constants/app_constants.dart';
import 'nofitication_service.dart';

class NotificationServiceImp extends NotificationService {
  final FirebaseMessaging _firebaseMessaging;
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationServiceImp(FirebaseMessaging? firebaseMessaging)
      : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance;

  @override
  Future<String?> getToken() async => await _firebaseMessaging.getToken() ?? '';

  @override
  Future<void> initializeFCM() async {
    await _configureLocalTimeZone();
    await _configFirebaseMessageForAndroid();
  }

  @override
  Future<void> deleteToken() => _firebaseMessaging.deleteToken();

  @override
  Future<void> scheduleNotification(
      {required int id,
        required String title,
        required String body,
        required int year,
        required int month,
        required int day,
        required int hour,
        required int minutes,
        required NotificationDetails notificationDetails}) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _convertTime(year, month, day, hour, minutes),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    ); //
  }

  Future<void> _configFirebaseMessageForAndroid() async {
    await _firebaseMessaging.requestPermission();
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    final platform = _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.initialize(
      initializationSettingsAndroid,
    );
    await platform?.createNotificationChannel(NotificationChannel.androidChannel);
  }

  Future<void> _configFirebaseMessageForIOS() {
    throw UnimplementedError();
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  static tz.TZDateTime _convertTime(int year, int month, int day, int hour, int minutes) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }
}
