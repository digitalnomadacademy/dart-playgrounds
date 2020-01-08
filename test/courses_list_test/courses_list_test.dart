import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:playground_app/observable_lessons/courses_observable.dart';
import 'package:playground_app/widgets/courses_list.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Golden test 1', (WidgetTester tester) async {
    Widget widget = MaterialApp(
      home: Provider<CoursesO>.value(
        value: MockCoursesO.introduction,
        child: Material(
          child: Center(
            child: RepaintBoundary(child: CoursesList()),
          ),
        ),
      ),
    );
    await tester.pumpWidget(widget);

    await expectLater(
        find.byType(CoursesList), matchesGoldenFile('courses_list.png'));
  });
}
