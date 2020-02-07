import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/service/courses_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';

class CoursesModel implements Disposable {
  final CoursesService coursesService;

  CoursesO coursesO;
  BehaviorSubject<CoursesO> coursesO$ = BehaviorSubject<CoursesO>();

  CoursesModel({@required this.coursesService})
      : assert(coursesService != null) {
    _initCoursesModel();
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
                  ))
              .toList()));
    });
    return null;
  }

  @override
  Future<void> dispose() async {
    coursesO$.close();
    //  courseO$.close();
  }
}
