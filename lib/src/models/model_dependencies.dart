import 'package:get_it/get_it.dart';

import 'auth/user_model.dart';
import 'model_chatgpt/request_model/chatgpt_request.dart';
import 'model_chatgpt/response_model/chatgpt_reply_response.dart';
import 'model_chatgpt/response_model/get_model_chatgpt_response.dart';


class ModelDependencies {
  static void init(GetIt injector) {
    injector.registerFactory(() => ListModelResponse());
    injector.registerFactory(() => Model());

    injector.registerFactory(() => ChatGPTResponse());
    injector.registerFactory(() => Choices());
    injector.registerFactory(() => Usage());

    injector.registerFactory(() => ChatGPTRequest());
    injector.registerFactory(() => const UserModel());
  }
}
