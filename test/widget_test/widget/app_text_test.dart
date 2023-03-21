import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/app_text.dart';
import 'package:mock_project/src/theme/app_theme.dart';

void main() {
  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    home: const Scaffold(
      body: AppText(text: '',),
    ),
  );

  testWidgets('AppElevatedButton should have [Text] Text', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Text), findsOneWidget);
  });
}