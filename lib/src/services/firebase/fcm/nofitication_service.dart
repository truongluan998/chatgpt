import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationService {
  Future<String?> getToken();

  Future<void> deleteToken();

  Future<void> initializeFCM();

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minutes,
    required NotificationDetails notificationDetails,
  });
}
