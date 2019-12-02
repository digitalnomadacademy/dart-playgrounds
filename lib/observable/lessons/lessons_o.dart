import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoursesO {
  final List<CourseO> courses;

  const CoursesO({
    @required this.courses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesO &&
          runtimeType == other.runtimeType &&
          courses == other.courses;

  @override
  int get hashCode => courses.hashCode;
}

class CourseO {
  final String courseID;

  final String name;
  final String description;

  final double progress;

  final Color color;

  final bool unlocked;

  const CourseO({
    @required this.courseID,
    @required this.name,
    @required this.color,
    @required this.description,
    @required this.progress,
    @required this.unlocked,
  }) : assert(progress <= 1 && progress >= 0, 'Progress out of bounds');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseO &&
          runtimeType == other.runtimeType &&
          courseID == other.courseID &&
          name == other.name &&
          description == other.description &&
          progress == other.progress &&
          color == other.color &&
          unlocked == other.unlocked;

  @override
  int get hashCode =>
      courseID.hashCode ^
      name.hashCode ^
      description.hashCode ^
      progress.hashCode ^
      color.hashCode ^
      unlocked.hashCode;
}

class MockCoursesO implements CoursesO {
  @override
  List<CourseO> get courses => [
        CourseO(
            courseID: '1',
            name: 'Dart Introduction 1',
            color: Colors.blue,
            description: 'Basic steps into programming',
            progress: 0.5,
            unlocked: true),
        CourseO(
            courseID: '2',
            name: 'Dart Introduction 2',
            color: Colors.blueAccent,
            description:
                'Once you finished the basics, get ready for some advanced topics',
            progress: 0,
            unlocked: false),
      ];
}
