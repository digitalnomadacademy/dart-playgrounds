import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:playground_app/ui_pages/splash_screen.dart';

void main() {

  Widget homePageTest() {
    return MaterialApp(
      home: Center(
        child: RepaintBoundary(child: SplashScreen()),
      ),
    );
  }

  testWidgets('Golden test 1', (WidgetTester tester) async {
    Widget widget = homePageTest();
    await tester.pumpWidget(widget);
    await tester.pump(Duration(seconds: 1));
    await expectLater(find.byType(SplashScreen), matchesGoldenFile('splashScreenGoldenOneSecond.png'));
  });
  testWidgets('Golden test 2', (WidgetTester tester) async {
    Widget widget = homePageTest();
    await tester.pumpWidget(widget);
    await tester.pump(Duration(seconds: 2));
    await expectLater(find.byType(SplashScreen), matchesGoldenFile('splashScreenGoldenTwoSecond.png'));
  });
  testWidgets('Golden test 3', (WidgetTester tester) async {
    Widget widget = homePageTest();
    await tester.pumpWidget(widget);
    await tester.pump(Duration(seconds: 3));
    await expectLater(find.byType(SplashScreen), matchesGoldenFile('splashScreenGoldenThreeSecond.png'));
  });
}

