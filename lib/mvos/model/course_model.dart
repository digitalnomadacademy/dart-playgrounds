import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/service/course_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/subjects.dart';

typedef Future<void> CreateCourse({
  int color,
  String description,
  List lessons,
  String name,
  String videoPlaylistUrl,
});

typedef Future<void> DeleteCourse({
  String name,
});

typedef SelectCourse({CourseO courseO});

class CourseModel implements Disposable {
  final CourseService courseService;
  CreateCourseA createCourseA;
  DeleteCourseA deleteCourseA;
  SelectCourseA selectCourseA;

  BehaviorSubject<ActiveCourseO> activeCourseO$ =
      BehaviorSubject<ActiveCourseO>();

  CourseModel({
    @required this.courseService,
  }) : assert(courseService != null) {
    createCourseA = CreateCourseA(createCourse: createCourse);
    deleteCourseA = DeleteCourseA(deleteCourse: deleteCourse);
    selectCourseA = SelectCourseA(selectCourse: selectCourse);
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

  Future<void> deleteCourse({
    String name,
  }) async {
    return courseService.deleteCourse(name);
  }

  void selectCourse({CourseO courseO}) {
    activeCourseO$.add(ActiveCourseO(activeCourse: courseO));
  }

  @override
  Future<void> dispose() {
    activeCourseO$.close();
    return null;
  }
}
