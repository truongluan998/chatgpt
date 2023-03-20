import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/blocs/authentication/authentication_cubit.dart';
import 'package:mock_project/src/blocs/authentication/authentication_state.dart';
import 'package:mock_project/src/services/firebase/auth/auth_service.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

Future<void> main() async {
  late MockAuthService mockAuthService;
  late AuthenticationCubit authenticationCubit;

  setUp(() {
    mockAuthService = MockAuthService();
    authenticationCubit = AuthenticationCubit(mockAuthService);
  });

  tearDown(() {
    authenticationCubit.close();
  });

  blocTest<AuthenticationCubit, AuthenticationState>(
    'emits AuthenticationState.success() state when SignIn success',
    build: () {
      when(() => mockAuthService.signInWithEmailAndPassword(email: 'test6@gmail.com', password: 'anhti123'))
          .thenAnswer((_) => Future.value(true));
      return authenticationCubit;
    },
    act: (cubit) => cubit.signInWithCredentials('test6@gmail.com', 'anhti123'),
    expect: () => [
      const AuthenticationState.submitting(),
      const AuthenticationState.success(),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'emits AuthenticationState.Error() state when SignIn Error',
    build: () {
      when(() => mockAuthService.signInWithEmailAndPassword(email: 'test6@gmail.com', password: 'anhti123'))
          .thenAnswer((_) => Future.value(false));
      return authenticationCubit;
    },
    act: (cubit) => cubit.signInWithCredentials('test6@gmail.com', 'anhti123'),
    expect: () => [
      const AuthenticationState.submitting(),
      const AuthenticationState.error(message: 'Login Fail'),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'emits AuthenticationState.Error() state when SignIn throw Exception',
    build: () {
      when(() => mockAuthService.signInWithEmailAndPassword(email: 'test6@gmail.com', password: 'anhti123'))
          .thenThrow(FirebaseAuthException(code: '401'));
      return authenticationCubit;
    },
    act: (cubit) => cubit.signInWithCredentials('test6@gmail.com', 'anhti123'),
    expect: () => [
      const AuthenticationState.submitting(),
      const AuthenticationState.error(message: null),
    ],
  );

  // blocTest<AuthenticationCubit, AuthenticationState>(
  //   'emits AuthenticationState.success() state when SignUp success',
  //   build: () {
  //     when(
  //       () => mockAuthService.signUp(
  //         email: 'test6@gmail.com',
  //         password: 'anhti123',
  //         name: 'Hong Luan',
  //         phone: '0867025867',
  //       ),
  //     ).thenAnswer((_) => Future.value(true));
  //     return authenticationCubit;
  //   },
  //   act: (cubit) => cubit.signUpWithCredentials(
  //     'test6@gmail.com',
  //     'anhti123',
  //     'Hong Luan',
  //     '0867025867',
  //   ),
  //   expect: () => [
  //     const AuthenticationState.submitting(),
  //     const AuthenticationState.success(),
  //   ],
  // );
}
