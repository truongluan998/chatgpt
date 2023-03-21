import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/app_elevated_button.dart';
import 'package:mock_project/src/theme/app_theme.dart';
import 'package:mock_project/src/utils/show_toast.dart';

void main() {
  bool showToastCalled = false;
  final toast = ShowToast();
  final widget = MaterialApp(
    
    theme: AppTheme.buildTheme(),
    home: Scaffold(
      body: AppElevatedButton(
        press: () {
          showToastCalled = true;
          toast.showToast('123');
        },
        text: '',
      ),
    ),
  );
  testWidgets('AppElevatedButton is built with empty text and calls showToast', (tester) async {
    await tester.pumpWidget(widget);
    final appElevatedButton = find.byType(AppElevatedButton).evaluate().single.widget as AppElevatedButton;
    expect(appElevatedButton.text, equals(''));
    expect(showToastCalled, equals(false));
    await tester.tap(find.byType(AppElevatedButton));
    await tester.pumpAndSettle();
    expect(showToastCalled, equals(true));
  });


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
