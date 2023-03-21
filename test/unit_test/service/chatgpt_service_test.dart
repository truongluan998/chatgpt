import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mock_project/src/models/model_chatgpt/request_model/chatgpt_request.dart';
import 'package:mock_project/src/models/model_chatgpt/response_model/chatgpt_reply_response.dart';
import 'package:mock_project/src/models/model_chatgpt/response_model/get_model_chatgpt_response.dart';
import 'package:mock_project/src/services/base/base_service.dart';
import 'package:mock_project/src/services/chatgpt/chatgpt_service.dart';
import 'package:mocktail/mocktail.dart';

import 'package:rest_utils/rest_utils.dart';

import '../../mock_data/mock_data_reponse_reply_chatgpt.dart';
import '../../mock_data/mock_data_reponse_model_chatgpt.dart';

class MockRestUtils extends Mock implements RestUtil {}

class FakeGetResponseModel extends Fake implements ListModelResponse {}

class FakeChatGPTResponse extends Fake implements ChatGPTResponse {}

class FakeChatGPTRequest extends Fake implements ChatGPTRequest {}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockRestUtils restUtils;
  late ChatGPTService chatGPTService;
  final mockChatGPTResponse = ChatGPTResponse.fromJson(json.decode(chatgpt));
  final mockModelResponse = ListModelResponse.fromJson(json.decode(reponse));
  final request = ChatGPTRequest(
    prompt: 'hello',
    maxTokens: 10,
  );

  
  setUpAll(() {
    restUtils = MockRestUtils();
    chatGPTService = ChatGPTService(restUtils);
    registerFallbackValue(chatGPTService);
    registerFallbackValue(restUtils);
    registerFallbackValue(request);
    registerFallbackValue(mockModelResponse);
    registerFallbackValue(FakeGetResponseModel());
    registerFallbackValue(FakeChatGPTResponse());
  });


  // test('chatWithChatGPT', () async {
  //   when(
  //     () => restUtils.request(
  //       any(),
  //       Method.post,
  //     ),
  //   ).thenAnswer((_) async => Future.value(mockModelResponse));

  //   final response = await chatGPTService.chatWithChatGPT(
  //       prompt: request.prompt!, maxTokens: request.maxTokens);
  //   expect(response, isNotNull);
  // });

  // test('getAllModel', () async {
  //   when(() => restUtils.request(any(), Method.get))
  //       .thenAnswer((realInvocation) => Future.value(mockModelResponse));
  //
  //   final actualResponse = await chatGPTService.getAllModel();
  //   expect(actualResponse, isNotNull);
  // });
}
