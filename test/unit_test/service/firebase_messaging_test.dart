import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/services/firebase/fcm/nofitication_service.dart';
import 'package:mock_project/src/services/firebase/fcm/notification_service_imp.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

class MockNotificationService extends Mock implements NotificationService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFirebaseMessaging mockFirebaseMessaging;
  late NotificationServiceImp notificationImp;
  late MockNotificationService mockNotificationService;
  setUp(() {
    mockFirebaseMessaging = MockFirebaseMessaging();
    notificationImp = NotificationServiceImp(mockFirebaseMessaging);
    mockNotificationService = MockNotificationService();
  });
  test('getToken should call FirebaseMessaging.getToken', () async {
    when(() => mockFirebaseMessaging.getToken())
        .thenAnswer((_) => Future.value('token'));
    final token = await notificationImp.getToken();
    expect(token, 'token');
  });
  test('deleteToken should call FirebaseMessaging.deleteToken', () async {
    when(() => mockFirebaseMessaging.deleteToken())
        .thenAnswer((_) => Future.value());
    await notificationImp.deleteToken();
    verify(() => mockFirebaseMessaging.deleteToken());
  });
}
