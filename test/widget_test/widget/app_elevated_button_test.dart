import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/app_elevated_button.dart';

void main() {
  final widget = MaterialApp(
    home: Scaffold(
      body: AppElevatedButton(
        press: () {},
        text: '',
      ),
    ),
  );


  testWidgets('AppElevatedButton should have [SizedBox] SizedBox', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('ElevatedButton should have [ElevatedButton] ElevatedButton', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('ElevatedButton should have [Padding] Padding', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Padding), findsWidgets);
  });

  testWidgets('ElevatedButton should have [Text] Text', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Text), findsOneWidget);
  });
}
