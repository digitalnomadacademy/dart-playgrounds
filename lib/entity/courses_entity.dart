import 'dart:ui';

import 'package:flutter/foundation.dart';

class CoursesE {
  final List<CourseE> courses;

  const CoursesE({
    @required this.courses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CoursesE &&
              runtimeType == other.runtimeType &&
              courses == other.courses;

  @override
  int get hashCode => courses.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'courses': this.courses,
    };
  }

  factory CoursesE.fromMap(Map<String, dynamic> map) {
    return new CoursesE(
      courses: map['courses'] as List<CourseE>,
    );
  }
}

class CourseE {
  final String courseID;

  final String name;
  final String description;

  final double progress;

  final Color color;

  final bool unlocked;

  const CourseE({
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
          other is CourseE &&
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

  Map<String, dynamic> toMap() {
    return {
      'courseID': this.courseID,
      'name': this.name,
      'description': this.description,
      'progress': this.progress,
      'color': this.color,
      'unlocked': this.unlocked,
    };
  }

  factory CourseE.fromMap(Map<String, dynamic> map) {
    return new CourseE(
      courseID: map['courseID'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      progress: map['progress'] as double,
      color: map['color'] as Color,
      unlocked: map['unlocked'] as bool,
    );
  }
}