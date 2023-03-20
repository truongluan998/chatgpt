import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/app_text_form_field.dart';

void main() {
  final widget = MaterialApp(
    home: Scaffold(
      body: AppTextFormField(
        textEditingController: TextEditingController(),
      ),
    ),
  );

  testWidgets('AppTextFormField should have [Material] Material', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Material), findsAtLeastNWidgets(1));
  });

  testWidgets('AppTextFormField should have [ConstrainedBox] ConstrainedBox', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(ConstrainedBox), findsAtLeastNWidgets(1));
  });

  testWidgets('AppTextFormField should have [TextFormField] TextFormField', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('AppTextFormField should have [Icon] Icon', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Icon), findsOneWidget);
  });
}
