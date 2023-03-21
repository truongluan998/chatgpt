import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/profile/widgets/custom_column_infor_profile.dart';
import 'package:mock_project/src/screens/widgets/app_text.dart';
import 'package:mock_project/src/theme/app_theme.dart';

void main() {
  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    home: const Scaffold(
      body: CustomColumnInforProfile(
        title: '',
        content: '',
      ),
    ),
  );

  testWidgets('CustomColumnInforProfile should have [Column] Column', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('CustomColumnInforProfile should have [AppText] AppText', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(AppText), findsNWidgets(2));
  });
}
