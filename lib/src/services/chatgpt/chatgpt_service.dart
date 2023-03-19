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
    String? model = AppConstants.defaultModel,
    double? temperature = AppConstants.defaultTemperature,
    int? maxTokens = AppConstants.defaultMaxTokens,
  }) async =>
      rest.request(
        '/completions',
        Method.post,
        request: ChatGPTRequest()
          ..prompt = prompt
          ..maxTokens = maxTokens
          ..model = model
          ..temperature = temperature,
      );
}
