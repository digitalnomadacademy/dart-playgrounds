import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/service/courses_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';

typedef Future<void> CreateCourse({
  int color,
  String description,
  List lessons,
  String name,
  String videoPlaylistUrl,
});

typedef Future<void> UpdateCourse({
  int color,
  String description,
  List lessons,
  String name,
  String videoPlaylistUrl,
});

typedef Future<void> GetCourse({
  String name,
});

typedef Future<void> DeleteCourse({
  String name,
});

class CoursesModel implements Disposable {
  final CoursesService coursesService;
  CreateCourseA createCourseA;
  DeleteCourseA deleteCourseA;
  UpdateCourseA updateCourseA;
  GetCourseA getCourseA;
  CoursesO coursesO;
  BehaviorSubject<CoursesO> coursesO$ = BehaviorSubject<CoursesO>();
  BehaviorSubject<CourseO> courseO$ = BehaviorSubject<CourseO>();

  CoursesModel({@required this.coursesService})
      : assert(coursesService != null) {
    _initCoursesModel();
    createCourseA = CreateCourseA(createCourse: createCourse);
    deleteCourseA = DeleteCourseA(deleteCourse: deleteCourse);
    updateCourseA = UpdateCourseA(updateCourse: updateCourse);
    getCourseA = GetCourseA(getCourse: getCourse);
  }

  Future<void> _initCoursesModel() {
    coursesService.coursesE$.listen((CoursesE coursesE) {
      coursesO$.add(CoursesO(
          courses: coursesE.courses
              .map((CourseE courseE) => CourseO(
                    courseID: courseE.id,
                    name: courseE.name,
                    description: courseE.description,
                    color: courseE.color,
                    lessons: courseE.lessons,
                  ))
              .toList()));
    });

    coursesService.courseE$.listen((CourseE courseE) {
      courseO$.add(CourseO(
          courseID: courseE.id,
          name: courseE.name,
          color: courseE.color,
          description: courseE.description,
          lessons: courseE.lessons));
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

  Future<void> updateCourse({
    int color,
    String description,
    List lessons,
    String name,
    String videoPlaylistUrl,
  }) async {
    return coursesService.updateCourse(
        color, description, lessons, name, videoPlaylistUrl);
  }

  Future<void> getCourse({
    String name,
  }) async {
    return coursesService.getCourse(name);
  }

  Future<void> deleteCourse({
    String name,
  }) async {
    return coursesService.deleteCourse(name);
  }

  @override
  Future<void> dispose() async {
    coursesO$.close();
    courseO$.close();
    //  courseO$.close();
  }
}
