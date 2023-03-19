import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/models/auth/user_model.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import 'package:mocktail/mocktail.dart';

import '../../mock_data/firebase_cloud.dart';

class MockAuthService extends Mock implements AuthService {}

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockFirebaseUser extends Mock implements firebase_auth.User {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReferenceMap extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockFirebaseFirestoreDocumentReference extends Mock
    implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot{}


Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  MockAuthService mockAuthService;
  final mockFirebaseAuth = MockFirebaseAuth();
  final authServiceImpl = AuthServiceImpl(firebaseAuth: mockFirebaseAuth);
  late MockCollectionReference mockCollectionReference;
  late MockFirebaseFirestoreDocumentReference mockFirebaseFirestoreDocumentReference;
  late DocumentSnapshot mockDocumentSnapshot;


  setUpAll(() async {
    mockFirebaseFirestoreDocumentReference = MockFirebaseFirestoreDocumentReference();
    mockCollectionReference = MockCollectionReference();
    mockAuthService = MockAuthService();
    mockDocumentSnapshot = MockDocumentSnapshot();
    registerFallbackValue(mockCollectionReference);
    registerFallbackValue(mockFirebaseFirestoreDocumentReference);
    registerFallbackValue(mockDocumentSnapshot);
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
  // test('getCurrentUser returns user when user is logged in and has a profile in the database', () async {
  //     final mockUser = MockFirebaseUser();
  //     final mockDocumentReferentMap = MockDocumentReferenceMap();
  //     final userData = {
  //       'id': 'user_id',
  //       'name': 'John Doe',
  //       'email': 'john.doe@example.com',
  //       'phone': '1234567890',
  //       'photo': 'https://example.com/photo.jpg',
  //       'password': 'password',
  //     };
  //     final instance = FakeFirebaseFirestore();
  //     await instance.collection('Users').add({
  //       'id': 'user_id',
  //       'name': 'John Doe',
  //       'email': 'john.doe@example.com',
  //       'phone': '1234567890',
  //       'photo': 'https://example.com/photo.jpg',
  //       'password': 'password',
  //     });
  //     final snapshot = await instance.collection('Users').get();
  //     final mockDocumentReferenceUser = instance.collection('Users');
  //     final getUser = await mockDocumentReferenceUser.doc('user_id').get();


  //     when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
  //     when(() => mockUser.uid).thenReturn('user_id');
  //     when(() => mockCollectionReference.doc('user_id').get())
  //       .thenAnswer((realInvocation) => Future.value(getUser));
  //     // when(() => mockDocumentSnapshot.get('user_id')).thenReturn(mockDocumentSnapshot);
  //     // when(() => mockCollectionReference.doc('user_id')).thenReturn(mockDocumentReferentMap);
  //     // when(() => mockDocumentReferentMap.get())
  //     //   .thenAnswer((realInvocation) => Future.value(getUser));
  //     // when(() => mockDocumentSnapshot.data()).thenReturn(userData);
  //     // when(() => FirebaseFirestore.instance.collection('Users')).thenReturn(mockCollectionReference);

  //     final user = await authServiceImpl.getCurrentUser();

  //     expect(user, isNotNull);
  //     expect(user!.id, equals('user_id'));
  //     expect(user.name, equals('John Doe'));
  //     expect(user.email, equals('john.doe@example.com'));
  //     expect(user.phone, equals('1234567890'));
  //     expect(user.photo, equals('https://example.com/photo.jpg'));
  //     expect(user.password, equals('password'));
  //   });

  
  
}
