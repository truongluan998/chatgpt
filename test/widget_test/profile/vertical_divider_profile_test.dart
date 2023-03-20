import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/profile/widgets/vertical_divider_profile.dart';

void main() {
  const widget = MaterialApp(
    home: Scaffold(
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