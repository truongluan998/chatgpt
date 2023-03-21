 import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/app_dependencies.dart';
import 'package:mock_project/src/utils/app_configuration.dart';
import 'package:mock_project/src/utils/network/interceptor.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_data/firebase_cloud.dart';
class MockAppConfiguration extends Mock implements AppConfiguration {}

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
   late ChatGPTInterceptor interceptor;
   setUp(() async {
      await AppDependencies.initialize();

      interceptor = ChatGPTInterceptor();
    });
  test('onRequest should add an Authorization header to the options', () async {
      final options = RequestOptions(path: '/test');
      final handler = RequestInterceptorHandler();
      await interceptor.onRequest(options, handler);
      expect(options.headers['Authorization'], equals('Bearer '));
    });
}