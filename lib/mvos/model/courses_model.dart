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
  // StreamController<CoursesO> _coursesO = StreamController<CoursesO>.broadcast();
  // Stream<CoursesO> get coursesO => _coursesO.stream;
  BehaviorSubject<CoursesO> coursesO$ = BehaviorSubject<CoursesO>();
  BehaviorSubject<CourseO> courseO$ = BehaviorSubject<CourseO>();

  CoursesModel({@required this.coursesService})
      : assert(coursesService != null) {
    _initCoursesModel();
  }

  Future<void> _initCoursesModel() {
    coursesService.coursesE$.listen((CoursesE courses) {
      coursesO$.add(CoursesO(
          courses: courses.courses
              .map((doc) => courses.courses.add(CourseE(
                  id: doc.id,
                  name: doc.name,
                  description: doc.description,
                  color: doc.color,
                  videoPlaylistUrl: doc.videoPlaylistUrl,
                  lessons: doc.lessons)))
              .toList()));
    });
    return null;
  }

  @override
  Future<void> dispose() async {
    coursesO$.close();
    courseO$.close();
  }
}
