import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/blur_loading.dart';
import 'package:mock_project/src/theme/app_theme.dart';

void main() {
  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    home: const Scaffold(
      body: BlurLoading(),
    ),
  );

  testWidgets('BlurLoading should have [Container] Container', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('BlurLoading should have [Center] Center', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Center), findsWidgets);
  });

  testWidgets('BlurLoading should have [CircularProgressIndicator] CircularProgressIndicator', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(CircularProgressIndicator), findsWidgets);
  });
}
