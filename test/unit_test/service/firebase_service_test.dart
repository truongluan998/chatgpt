import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/models/auth/user_model.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';


import 'package:mocktail/mocktail.dart';

import '../../mock_data/firebase_cloud.dart';

class MockAuthService extends Mock implements AuthService {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class UserCredentialMock extends Mock implements UserCredential {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReferenceMap extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockFirebaseFirestoreDocumentReference extends Mock
    implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  MockAuthService mockAuthService;
  final mockFirebaseAuth = MockFirebaseAuth();
  final authServiceImpl = AuthServiceImpl(mockFirebaseAuth);
  late MockCollectionReference mockCollectionReference;
  late MockFirebaseFirestoreDocumentReference
      mockFirebaseFirestoreDocumentReference;
  late DocumentSnapshot mockDocumentSnapshot;
  late MockFirebaseFirestore mockFirebaseFirestore;

  setUpAll(() async {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockFirebaseFirestoreDocumentReference =
        MockFirebaseFirestoreDocumentReference();
    mockCollectionReference = MockCollectionReference();
    mockAuthService = MockAuthService();
    mockDocumentSnapshot = MockDocumentSnapshot();
    registerFallbackValue(mockCollectionReference);
    registerFallbackValue(mockFirebaseFirestore);
    registerFallbackValue(mockFirebaseFirestoreDocumentReference);
    registerFallbackValue(mockDocumentSnapshot);
    registerFallbackValue(mockFirebaseAuth);
    registerFallbackValue(MockFirebaseAuth);
    registerFallbackValue(MockCollectionReference);
    registerFallbackValue(MockDocumentReferenceMap);
    registerFallbackValue(MockFirebaseFirestoreDocumentReference);
    registerFallbackValue(MockDocumentSnapshot);
  });

  test('getCurrentUser returns null when user is not logged in', () async {
    mockAuthService = MockAuthService();

    when(() => mockAuthService.getCurrentUser())
        .thenAnswer((realInvocation) => Future.value(const UserModel()));

    final user = await authServiceImpl.getCurrentUser();

    expect(user, isNull);
  });

  test(
      'getCurrentUser returns null when user is logged in but does not have a profile in the database',
      () async {
    final mockUser = MockFirebaseUser();
    final mockDocumentReferentMap = MockDocumentReferenceMap();
    when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
    when(() => mockUser.uid).thenReturn('user_id');
    when(() => mockCollectionReference.doc('user_id'))
        .thenReturn(mockDocumentReferentMap);
    final user = await authServiceImpl.getCurrentUser();
    expect(user, isNull);
  });

  test('should return true if user is successfully created', () async {
    final mockUser = MockFirebaseUser();
    const email = 'test@test.com';
    const password = 'password';
    const name = 'Test User';
    const phone = '1234567890';

    final userCredentialMock = UserCredentialMock();
    when(() => mockFirebaseAuth.fetchSignInMethodsForEmail(email))
        .thenAnswer((_) => Future.value([]));

    when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .thenAnswer((_) => Future.value(userCredentialMock));
    when(() => userCredentialMock.user).thenReturn(mockUser);
    when(() => mockUser.uid).thenReturn('123123');
    // verify(mockCollectionReference.doc(mockUser.uid).set(any()) as Function());

    final result = await authServiceImpl.signUp(
        email: email, password: password, name: name, phone: phone);

    // Assert
    expect(result, true);
  });

  test('should return true if user is login ', () async {
    final mockUser = MockFirebaseUser();
    const email = 'test@test.com';
    const password = 'password';
  

    final userCredentialMock = UserCredentialMock();
    when(() => mockFirebaseAuth.fetchSignInMethodsForEmail(email))
        .thenAnswer((_) => Future.value([]));

    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .thenAnswer((_) => Future.value(userCredentialMock));
    when(() => userCredentialMock.user).thenReturn(mockUser);

    final result = await authServiceImpl.signInWithEmailAndPassword(
        email: email, password: password);

    // Assert
    expect(result, isNotNull);
  });

  test('should return true if user is logout ', () async {
    when(() => mockFirebaseAuth.signOut())
        .thenAnswer((_) => Future.value(true));
    final result = await authServiceImpl.logout();
    expect(result, isNotNull);
  });
}
