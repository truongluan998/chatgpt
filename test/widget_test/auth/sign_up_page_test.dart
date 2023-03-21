import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/app_dependencies.dart';
import 'package:mock_project/src/blocs/authentication/authentication_cubit.dart';
import 'package:mock_project/src/blocs/authentication/authentication_state.dart';
import 'package:mock_project/src/constants/app_constants.dart';
import 'package:mock_project/src/screens/auth/sign_up_page.dart';
import 'package:mock_project/src/screens/auth/widget/login_with_social_button.dart';
import 'package:mock_project/src/screens/widgets/app_text_form_field.dart';
import 'package:mock_project/src/theme/app_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../mock_data/firebase_cloud.dart';

class MockAuthenticationCubit extends Mock implements AuthenticationCubit {}

class FakeAuthenticationState extends Fake implements AuthenticationState {}

void main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  late AuthenticationCubit authenticationCubit;

  setUpAll(() async {
    await AppDependencies.initialize();
    authenticationCubit = AppDependencies.injector.get<AuthenticationCubit>();
    registerFallbackValue(FakeAuthenticationState);
    registerFallbackValue(MockAuthenticationCubit);
  });

  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    builder: (context, child) => ResponsiveWrapper.builder(
      BouncingScrollWrapper.builder(context, child!),
      breakpoints: [
        const ResponsiveBreakpoint.resize(
          DimensionConstants.responsiveBreakPointMobile,
          name: MOBILE,
        ),
        const ResponsiveBreakpoint.resize(
          DimensionConstants.responsiveBreakPointTablet,
          name: TABLET,
        ),
        const ResponsiveBreakpoint.resize(
          DimensionConstants.responsiveBreakPointDesktop,
          name: DESKTOP,
        ),
        const ResponsiveBreakpoint.resize(
          DimensionConstants.responsiveBreakPoint4k,
          name: AppConstants.fourK,
        ),
      ],
    ),
    home: BlocProvider(create: (context) => authenticationCubit, child: const SignUpPage()),
  );

  testWidgets('SignInPage should have [Visibility] Visibility', (WidgetTester tester) async {
    when(() => MockAuthenticationCubit().state).thenReturn(const Submitting());
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(Visibility), findsOneWidget);
  });

  testWidgets('SignInPage should have [Stack] Stack', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    when(() => MockAuthenticationCubit().state).thenReturn(const Submitting());
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(Stack), findsWidgets);
  });

  testWidgets('SignInPage should have [ResponsiveRowColumnItem] ResponsiveRowColumnItem', (WidgetTester tester) async {
    when(() => MockAuthenticationCubit().state).thenReturn(const Submitting());
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(ResponsiveRowColumnItem), findsAtLeastNWidgets(11));
  });

  testWidgets('SignInPage should have [ResponsiveRowColumn] ResponsiveRowColumn', (WidgetTester tester) async {
    when(() => MockAuthenticationCubit().state).thenReturn(const Submitting());
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(ResponsiveRowColumn), findsAtLeastNWidgets(3));
  });

  testWidgets('SignInPage should have [AppTextFormField] AppTextFormField', (WidgetTester tester) async {
    when(() => MockAuthenticationCubit().state).thenReturn(const Submitting());
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(AppTextFormField), findsAtLeastNWidgets(4));
  });

  testWidgets('SignInPage should have [LoginWithSocialButton] LoginWithSocialButton', (WidgetTester tester) async {
    when(() => MockAuthenticationCubit().state).thenReturn(const Submitting());
    await tester.pumpWidget(widget);
    await tester.pump();
    expect(find.byType(LoginWithSocialButton), findsAtLeastNWidgets(3));
  });
}
