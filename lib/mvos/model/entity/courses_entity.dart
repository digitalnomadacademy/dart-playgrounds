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
  final String id;
  final String name;
  final String description;
  final Color color;
  final String videoPlaylistUrl;
  List<LessonE> lessons;
}

class LessonE {
  final String id;
  final String name;
  final String description;
  final String videoUrl;
  final String githubUrl;
}
