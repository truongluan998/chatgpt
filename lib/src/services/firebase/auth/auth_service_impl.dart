import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';

import '../../../models/auth/user_model.dart';
import 'auth_service.dart';

class AuthServiceImpl extends AuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthServiceImpl({required firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final userRef = FirebaseFirestore.instance.collection('Users');

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser?.uid.isNotEmpty ?? false) {
        final getUser = await userRef.doc(currentUser?.uid).get();
        if (getUser.data()?.isNotEmpty ?? false) {
          return UserModel.fromJson(getUser.data()!);
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final checkEmail = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    if (checkEmail.isEmpty) {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then(
        (userCredential) {
          userRef.doc(userCredential.user?.uid ?? '').set(
                UserModel(
                  id: userCredential.user?.uid ?? '',
                  email: email,
                  name: name,
                  phone: phone,
                  photo: userCredential.user?.photoURL ?? '',
                  password: password,
                ).toJson(),
              );
        },
      );
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    }on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
