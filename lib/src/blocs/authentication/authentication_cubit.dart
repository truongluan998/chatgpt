import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/firebase/auth/auth_service.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._authService) : super(const AuthenticationState.initial());

  final AuthService _authService;

  Future<void> signInWithCredentials(String email, String password) async {
    emit(const AuthenticationState.submitting());
    try {
      await _authService.signInWithEmailAndPassword(email: email, password: password);
      emit(const AuthenticationState.success());
    } on FirebaseAuthException catch (error) {
      emit(AuthenticationState.error(message: error.message));
    }
  }

  Future<void> signUpWithCredentials(String email, String password, String name, String phone) async {
    emit(const AuthenticationState.submitting());
    try {
      final isSignUpSuccess = await _authService.signUp(email: email, password: password, name: name, phone: name);
      if (isSignUpSuccess) {
        emit(const AuthenticationState.success());
      } else {
        emit(AuthenticationState.error(message: 'email_already_exists'.tr()));
      }
    } on FirebaseAuthException catch (error) {
      emit(AuthenticationState.error(message: error.message));
    }
  }
}
