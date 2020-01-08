import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:playground_app/widgets/drawer.dart';

void main() {

  testWidgets('Golden test 1', (WidgetTester tester) async {
    Widget widget = MaterialApp(
      home: Center(
        child: RepaintBoundary(child: CustomDrawer()),
      ),
    );
    await tester.pumpWidget(widget);

    await expectLater(
        find.byType(CustomDrawer), matchesGoldenFile('drawer_test.png'));
  });
}
