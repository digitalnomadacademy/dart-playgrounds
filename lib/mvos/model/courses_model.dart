import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/service/courses_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

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

class CoursesModel implements Disposable {
  final CoursesService coursesService;

  CreateCourseA createCourseA;
  DeleteCourseA deleteCourseA;
  SelectCourseA selectCourseA;
  UpdateCourseA updateCourseA;
  BehaviorSubject<ActiveCourseO> activeCourseO$ =
      BehaviorSubject<ActiveCourseO>();
  BehaviorSubject<CoursesO> coursesO$ = BehaviorSubject<CoursesO>();

  CoursesModel({@required this.coursesService})
      : assert(coursesService != null) {
    _initCoursesModel();
  }

  Future<void> _initCoursesModel() {
    createCourseA = CreateCourseA(createCourse: createCourse);
    deleteCourseA = DeleteCourseA(deleteCourse: deleteCourse);
    selectCourseA = SelectCourseA(selectCourse: selectCourse);
    updateCourseA = UpdateCourseA(updateCourse: updateCourse);

    coursesService.coursesE$.listen((CoursesE coursesE) {
      coursesO$.add(CoursesO(
          courses: coursesE.courses
              .map((CourseE courseE) => CourseO(
                  courseID: courseE.id,
                  name: courseE.name,
                  description: courseE.description,
                  color: courseE.color,
                  videoPlaylistUrl: courseE.videoPlaylistUrl))
              .toList()));
    });
    return null;
  }

  Future<void> createCourse({
    int color,
    String description,
    List lessons,
    String name,
    String videoPlaylistUrl,
  }) async {
    return coursesService.addCourse(
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
    return coursesService.deleteCourse(name);
  }

  void selectCourse({CourseO courseO}) {
    activeCourseO$.add(ActiveCourseO(activeCourse: courseO));
  }

  Future<void> updateCourse(
      {String courseID,
      String newName,
      String description,
      String videoPlaylistUrl,
      List lessons,
      int color}) {
    return coursesService.updateCourseData(
      courseID,
      newName: newName,
      lessons: lessons,
      videoPlaylistUrl: videoPlaylistUrl,
      description: description,
      color: color,
    );
  }

  @override
  Future<void> dispose() async {
    coursesO$.close();
    activeCourseO$.close();
  }
}
