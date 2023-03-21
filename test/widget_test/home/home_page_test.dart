import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/app_dependencies.dart';
import 'package:mock_project/src/blocs/authentication/authentication_cubit.dart';
import 'package:mock_project/src/blocs/authentication/authentication_state.dart';
import 'package:mock_project/src/blocs/chat/chat_cubit.dart';
import 'package:mock_project/src/blocs/chat/chat_state.dart';
import 'package:mock_project/src/models/model_chatgpt/chat_model.dart';
import 'package:mock_project/src/screens/home/home_page.dart';
import 'package:mock_project/src/theme/app_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_data/firebase_cloud.dart';

class MockAuthenticationCubit extends Mock implements AuthenticationCubit {}

class MockChatCubit extends Mock implements ChatCubit {}

class FakeAuthenticationState extends Fake implements AuthenticationState {}

class FakeChatState extends Fake implements ChatState {}

void main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  late AuthenticationCubit authenticationCubit;
  late ChatCubit chatCubit;

  setUpAll(() async {
    await AppDependencies.initialize();
    authenticationCubit = AppDependencies.injector.get<AuthenticationCubit>();
    chatCubit = AppDependencies.injector.get<ChatCubit>();
    registerFallbackValue(MockAuthenticationCubit);
    registerFallbackValue(MockChatCubit);
    registerFallbackValue(FakeAuthenticationState);
    registerFallbackValue(FakeChatState);
  });

  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    home: BlocProvider(
      create: (context) => chatCubit,
      child: const HomePage(),
    ),
  );

  testWidgets('HomePage should have [AppBar] AppBar', (WidgetTester tester) async {
    when(() => MockChatCubit().state).thenReturn(
      const ChatLoaded(
        [
          Message(
            text: 'demo',
            sender: 'demo',
            timestamp: 'demo',
          )
        ],
        '',
      ),
    );
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(AppBar), findsWidgets);
  });
}
