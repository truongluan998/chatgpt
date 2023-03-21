import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/profile/widgets/vertical_divider_profile.dart';
import 'package:mock_project/src/theme/app_theme.dart';

void main() {
  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    home: const Scaffold(
      body: VerticalDividerProfile(),
    ),
  );

  testWidgets('VerticalDividerProfile should have [SizedBox] SizedBox', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(SizedBox), findsWidgets);
  });

  testWidgets('VerticalDividerProfile should have [VerticalDivider] VerticalDivider', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(VerticalDivider), findsOneWidget);
  });
}