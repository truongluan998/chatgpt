import 'package:mock_project/src/utils/validator.dart';
import 'package:test/test.dart';

void main() {
  group('Validator', () {
    late Validator validator;

    setUp(() {
      validator = Validator();
    });

    test('validateName should return an error message if the value is null', () {
      final errorMessage = validator.validateName(null);
      expect(errorMessage, isNull);
    });

    test('validateName should return null if the value is not null', () {
      final errorMessage = validator.validateName('John Doe');
      expect(errorMessage, equals('Họ và tên không được để trống'));
    });
  });
}
