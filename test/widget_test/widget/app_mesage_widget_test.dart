import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/app_message_widget.dart';
import 'package:mock_project/src/theme/app_color.dart';

void main() {
  const widget = MaterialApp(
    home: Scaffold(
      body: AppMessageWidget(
        content: '',
        backgroundColor: AppColor.primaryColor,
        textColor: AppColor.primaryColor,
        time: '',
        timeColor: AppColor.primaryColor,
        checkCurrentUserChat: true,
      ),
    ),
  );

  testWidgets('AppMessageWidget should have [Container] Container', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('AppMessageWidget should have [Column] Column', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('AppMessageWidget should have [Text] Text', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Text), findsOneWidget);
  });
}
