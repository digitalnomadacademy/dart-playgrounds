import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/service/course_service.dart';
import 'package:playground_app/shared/interfaces.dart';

typedef Future<void> CreateCourse({
  int color,
  String description,
  List lessons,
  String name,
  String videoPlaylistUrl,
});

class CourseModel implements Disposable {
  final CourseService courseService;
  CreateCourseA createCourseA;

  CourseModel({
    @required this.courseService,
  }) : assert(courseService != null) {
    createCourseA = CreateCourseA(createCourse: createCourse);
  }

  Future<void> createCourse({
    int color,
    String description,
    List lessons,
    String name,
    String videoPlaylistUrl,
  }) async {
    return courseService.addCourse(
      color,
      description,
      lessons,
      name,
      videoPlaylistUrl,
    );
  }

  @override
  Future<void> dispose() {
    return null;
  }
}
