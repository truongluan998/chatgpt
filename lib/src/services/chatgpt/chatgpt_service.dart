import 'package:rest_utils/rest_utils.dart';

import '../../constants/app_constants.dart';
import '../../models/model_chatgpt/request_model/chatgpt_request.dart';
import '../../models/model_chatgpt/response_model/chatgpt_reply_response.dart';
import '../../models/model_chatgpt/response_model/get_model_chatgpt_response.dart';
import '../base/base_service.dart';

class ChatGPTService extends BaseService {
  ChatGPTService(super.restUtils);

  Future<ListModelResponse> getAllModel() async => rest.request(
      '/models',
      Method.get,
    );

  Future<ChatGPTResponse> chatWithChatGPT({
    required String prompt,
    String? model,
    double? temperature,
    int? maxTokens,
  }) async {
    final request = ChatGPTRequest()
      ..maxTokens = maxTokens ?? AppConstants.defaultMaxTokens
      ..model = model ?? AppConstants.defaultModel
      ..temperature = temperature ?? AppConstants.defaultTemperature
      ..prompt = prompt;
    return rest.request(
      '/completions',
      Method.post,
      request: request,
    );
  }
}
