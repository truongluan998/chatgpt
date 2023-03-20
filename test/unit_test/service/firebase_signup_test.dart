import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service_impl.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data/firebase_cloud.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  late final FirebaseAuth _firebaseAuth;

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final user = MockUser();
    final userCredential = MockUserCredential();
    when(userCredential.user).thenReturn(user);
    when(user.uid).thenReturn('user123');
    return userCredential;
  }

  @override
  Future<List<String>> fetchSignInMethodsForEmail(String email) async {
    return <String>['password'];
  }

  @override
  User? get currentUser {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final user = MockUser();
    final userCredential = MockUserCredential();
    when(userCredential.user).thenReturn(user);
    when(user.uid).thenReturn('user123');
    return userCredential;
  }
}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockUser extends Mock implements User {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}





class MockAuthService extends Mock implements AuthService {}

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  late AuthService authService;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockFirebaseFirestore mockFirestore;
   setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirestore = MockFirebaseFirestore();
      authService = AuthServiceImpl(mockFirebaseAuth);
    });
  // test('signUp should return true if the email is not registered', () async {
  //     final email = 'test@test.com';
  //     final password = 'password';
  //     final name = 'John';
  //     final phone = '1234567890';
  //     final mockUserCredential = MockUserCredential();
  //     final mockDocRef = MockDocumentReference();

  //     when(mockFirebaseAuth.fetchSignInMethodsForEmail(email)).thenAnswer((_) async => []);
  //     when(mockFirebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).thenAnswer((_) async => mockUserCredential);
  //     when(mockUserCredential.user?.uid).thenReturn('123456');
  //     // when(mockFirestore.collection('Users').doc('123456')).thenReturn(mockDocRef);

  //     final result = await authService.signUp(email: email, password: password, name: name, phone: phone);

  //     expect(result, true);
  //   });
  test('signUp returns true if email is not registered', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final name = 'Test User';
      final phone = '123-456-7890';

      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockFirebaseAuth.fetchSignInMethodsForEmail(email)).thenAnswer((_) => Future.value([]));
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).thenAnswer((_) => Future.value(mockUserCredential));
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('test-uid');
      when(mockDocumentSnapshot.data()).thenReturn({
        'id': 'test-uid',
        'email': email,
        'name': name,
        'phone': phone,
        'photo': '',
        'password': password,
      });
      when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
      when(mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());

      // Act
      final result = await authService.signUp(email: email, password: password, name: name, phone: phone);

      // Assert
      expect(result, true);
    
    });
}
