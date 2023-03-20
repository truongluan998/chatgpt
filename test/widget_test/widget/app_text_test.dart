import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/app_text.dart';

void main() {
  const widget = MaterialApp(
    home: Scaffold(
      body: AppText(text: '',),
    ),
  );

  testWidgets('AppElevatedButton should have [Text] Text', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Text), findsOneWidget);
  });
}