import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/courses_model.dart';

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
  final String videoPlaylistUrl;
  const CourseO({
    @required this.courseID,
    @required this.name,
    this.color = Colors.pink,
    this.description = '',
    this.videoPlaylistUrl = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseO &&
          runtimeType == other.runtimeType &&
          courseID == other.courseID &&
          name == other.name &&
          description == other.description &&
          color == other.color &&
          videoPlaylistUrl == other.videoPlaylistUrl;

  @override
  int get hashCode =>
      courseID.hashCode ^
      name.hashCode ^
      description.hashCode ^
      color.hashCode ^
      videoPlaylistUrl.hashCode;
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

class DeleteCourseA {
  final DeleteCourse deleteCourse;

  const DeleteCourseA({@required this.deleteCourse})
      : assert(deleteCourse != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteCourseA &&
          runtimeType == other.runtimeType &&
          deleteCourse == other.deleteCourse;

  @override
  int get hashCode => deleteCourse.hashCode;
}

class ActiveCourseO {
  final CourseO activeCourse;

  const ActiveCourseO({
    @required this.activeCourse,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActiveCourseO &&
          runtimeType == other.runtimeType &&
          activeCourse == other.activeCourse;

  @override
  int get hashCode => activeCourse.hashCode;
}

class SelectCourseA {
  final SelectCourse selectCourse;

  const SelectCourseA({
    @required this.selectCourse,
  }) : assert(selectCourse != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectCourseA &&
          runtimeType == other.runtimeType &&
          selectCourse == other.selectCourse;

  @override
  int get hashCode => selectCourse.hashCode;
}

class UpdateCourseA {
  final UpdateCourse updateCourse;

  const UpdateCourseA({
    @required this.updateCourse,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateCourseA &&
          runtimeType == other.runtimeType &&
          updateCourse == other.updateCourse;

  @override
  int get hashCode => updateCourse.hashCode;
}
