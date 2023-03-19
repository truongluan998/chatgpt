import 'package:mock_project/src/services/base/base_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:rest_utils/rest_utils.dart';


class MockRestUtils extends Mock implements RestUtil {}

class TestService extends BaseService {
  TestService(RestUtil restUtils) : super(restUtils);
}


void main() {
  late RestUtil restUtil;

   setUp(() {
      restUtil = RestUtil('');
    });
    test('should set the rest property when initialized', () {
      final service = TestService(restUtil);
      expect(service.rest, equals(restUtil));
    });
}


