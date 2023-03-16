// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/app_dependencies.dart';
import 'package:mock_project/src/services/chatgpt/chatgpt_service.dart';
import 'package:rest_utils/rest_utils.dart';

void main() async {
  await AppDependencies.initialize();
  final rest = AppDependencies.injector.get<RestUtil>(instanceName: 'CHATGPTAPI');
  final service = AppDependencies.injector.get<ChatGPTService>();
  // remove this later
  test("tesst api post", () async {
    var result = await service.chatWithChatGPT(prompt: "xin chào");
    print(result.choices?.first.text ?? "123");
  });
  test("tesst api get", () async {
    var result = await service.getAllModel();
    print(result.object);
  });
}
