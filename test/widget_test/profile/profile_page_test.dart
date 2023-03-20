import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_project/src/screens/profile/profile_page.dart';
import 'package:mock_project/src/screens/profile/widgets/custom_column_infor_profile.dart';
import 'package:mock_project/src/screens/profile/widgets/vertical_divider_profile.dart';
import 'package:mock_project/src/screens/widgets/app_text.dart';

void main() {
  const widget = MaterialApp(
    home: ProfilePage(),
  );

  testWidgets('ProfilePage should have [Column] Column', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Column), findsAtLeastNWidgets(3));
  });

  testWidgets('ProfilePage should have [Stack] Stack', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Stack), findsWidgets);
  });

  testWidgets('ProfilePage should have [Image.asset] Image.asset', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('ProfilePage should have [Container] Container', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('ProfilePage should have [SizedBox] SizedBox', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(SizedBox), findsWidgets);
  });

  testWidgets('ProfilePage should have [Padding] Padding', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Padding), findsWidgets);
  });

  testWidgets('ProfilePage should have [IconButton] IconButton', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(IconButton), findsOneWidget);
  });

  testWidgets('ProfilePage should have [CircleAvatar] CircleAvatar', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('ProfilePage should have [AppText] AppText', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(AppText), findsAtLeastNWidgets(4));
  });

  testWidgets('ProfilePage should have [Divider] Divider', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('ProfilePage should have [Row] Row', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('ProfilePage should have [CustomColumnInforProfile] CustomColumnInforProfile', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(CustomColumnInforProfile), findsNWidgets(3));
  });

  testWidgets('ProfilePage should have [VerticalDividerProfile] VerticalDividerProfile', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(480, 760);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);

    expect(find.byType(VerticalDividerProfile), findsNWidgets(2));
  });
}