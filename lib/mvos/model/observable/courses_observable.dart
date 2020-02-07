import 'dart:ui';
import 'package:playground_app/mvos/model/course_model.dart';
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

  final Color color;

  const CourseO({
    @required this.courseID,
    @required this.name,
    @required this.color,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseO &&
          runtimeType == other.runtimeType &&
          courseID == other.courseID &&
          name == other.name &&
          description == other.description &&
          color == other.color;

  @override
  int get hashCode =>
      courseID.hashCode ^ name.hashCode ^ description.hashCode ^ color.hashCode;
}



class CreateCourseA {
  final CreateCourse createCourse;

  const CreateCourseA({@required this.createCourse})
      : assert(createCourse != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CreateCourseA &&
              runtimeType == other.runtimeType &&
              createCourse == other.createCourse;

  @override
  int get hashCode => createCourse.hashCode;
}