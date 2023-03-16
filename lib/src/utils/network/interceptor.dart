import 'package:dio/dio.dart';

import '../../app_dependencies.dart';
import '../app_configuration.dart';

class ChatGPTInterceptor extends Interceptor {
  final config = AppDependencies.injector.get<AppConfiguration>();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Bearer ${config.chatgptApiKey}';
    super.onRequest(options, handler);
  }
}
