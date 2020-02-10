import 'dart:async';
import 'package:flutter/cupertino.dart';
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
typedef void UpdateCourse(
    {String courseID,
    String newName,
    String description,
    String videoPlaylistUrl,
    List lessons,
    int color});

class CourseModel implements Disposable {
  final CourseService courseService;
  CreateCourseA createCourseA;
  DeleteCourseA deleteCourseA;
  SelectCourseA selectCourseA;
  UpdateCourseA updateCourseA;
  BehaviorSubject<ActiveCourseO> activeCourseO$ =
      BehaviorSubject<ActiveCourseO>();

  CourseModel({
    @required this.courseService,
  }) : assert(courseService != null) {
    createCourseA = CreateCourseA(createCourse: createCourse);
    deleteCourseA = DeleteCourseA(deleteCourse: deleteCourse);
    selectCourseA = SelectCourseA(selectCourse: selectCourse);
    updateCourseA = UpdateCourseA(updateCourse: updateCourse);
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

  void updateCourse(
      {String courseID,
      String newName,
      String description,
      String videoPlaylistUrl,
      List lessons,
      int color}) {
    return courseService.updateCourseData(
      courseID,
      newName: newName,
      lessons: lessons,
      videoPlaylistUrl: videoPlaylistUrl,
      description: description,
      color: color,
    );
  }

  @override
  Future<void> dispose() {
    activeCourseO$.close();
    return null;
  }
}
