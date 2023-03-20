import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/auth/widget/login_with_social_button.dart';

void main() {
  final widget = MaterialApp(
    home: Scaffold(
      body: LoginWithSocialButton(press: () {}, icon: Icons.verified_user),
    ),
  );

  testWidgets('LoginWithSocialButton should have [InkWell] InkWell', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('LoginWithSocialButton should have [Container] Container', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('LoginWithSocialButton should have [Icon] Icon', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Icon), findsOneWidget);
  });
}
