import 'package:global_configs/global_configs.dart';
import 'package:global_configuration/global_configuration.dart';

class AppConfiguration {
  String getString(String key) {
    final value = GlobalConfiguration().get(key);
    return value ?? '';
  }

  String get chatgptBaseUrl => getString('baseURL');
  String get chatgptApiKey => getString('secretKey');
}
