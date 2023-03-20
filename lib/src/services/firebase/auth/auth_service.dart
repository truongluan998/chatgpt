
import '../../../models/auth/user_model.dart';

abstract class AuthService {
  Future<UserModel?> getCurrentUser();

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  Future<bool> logout();
}
