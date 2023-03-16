import 'package:global_configs/global_configs.dart';
import 'package:global_configuration/global_configuration.dart';

class AppConfiguration {

  int getInt(String key) {
    var num = GlobalConfiguration().getValue(key);
    return num;
  }

  bool getBool(String key) {
    var result = GlobalConfiguration().getValue(key);
    return result;
  }

  String getString(String key) {
    final value = GlobalConfiguration().get(key);
    return value ?? '';
  }

  void setValue<T>(String key, T value) {
    GlobalConfigs().set(key, value);
  }
   String get chatgptBaseUrl => getString('baseURL');
   String get chatgptApiKey => getString('secretKey');
}