import 'package:rest_utils/rest_utils.dart';

abstract class BaseService {
  late RestUtil rest;
  BaseService(RestUtil restUtils) {
    rest = restUtils;
  }
}