import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/widgets/avatar_chat_widget.dart';
import 'package:mock_project/src/theme/app_theme.dart';

void main() {
  final widget = MaterialApp(
    theme: AppTheme.buildTheme(),
    home: const Scaffold(
      body: AvatarChatWidget(
        checkLastMessage: true,
      ),
    ),
  );

  testWidgets('AvatarChatWidget should have [Material] Material', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Material), findsWidgets);
  });

  testWidgets('AvatarChatWidget should have [Image.network] Image.network', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(Image), findsOneWidget);
  });

  // testWidgets('AvatarChatWidget should have [Center] Center', (tester) async {
  //   await tester.pumpWidget(widget);
  //
  //   expect(find.byType(Center), findsOneWidget);
  // });
  //
  // testWidgets('AvatarChatWidget should have [CircularProgressIndicator] CircularProgressIndicator', (tester) async {
  //   await tester.pumpWidget(widget);
  //
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  // });
  //
  // testWidgets('AvatarChatWidget should have [Icon] Icon', (tester) async {
  //   await tester.pumpWidget(widget);
  //
  //   expect(find.byType(Icon), findsOneWidget);
  // });
}
