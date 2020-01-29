import 'dart:async';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:playground_app/mvos/service/courses_service.dart';
import 'package:flutter/foundation.dart';

class CoursesModel implements Disposable {
  final CoursesServices coursesServices;
  final CourseO courseO;
final CoursesO coursesO;
 // StreamController<CoursesO> _coursesO = StreamController<CoursesO>.broadcast();
 // Stream<CoursesO> get coursesO => _coursesO.stream;
  BehaviorSubject<CourseO> courseO$ = BehaviorSubject<CourseO>();

  CoursesModel({@required this.coursesServices, @required this.courseO,@required this.coursesO}) {
    _initCourseModel();
  }

  Future<void> _initCourseModel() {
    coursesServices.courseE$.listen((CourseE course) {
      courseO$.add(CourseO(
          courseID: course.id,
          name: course.name,
          color: course.color,
          description: course.description));
    });
    return null;
  }

  @override
  Future<void> dispose() async {
   // _coursesO.close();
    courseO$.close();
  }
}
