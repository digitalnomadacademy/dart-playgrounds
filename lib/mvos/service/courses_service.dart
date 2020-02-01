import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';

class CoursesService implements Disposable {
  final database = Firestore.instance;

  BehaviorSubject<CoursesE> coursesE$ = BehaviorSubject<CoursesE>();

  CoursesService() {
    _initCourseE();
  }

  Future<void> _initCourseE() async {
    CollectionReference reference = database.collection('courses');
    reference.snapshots().listen((querySnapshot) {
      querySnapshot.documentChanges.forEach((course) {
        coursesE$.add(CoursesE(
            courses: querySnapshot.documents
                .map((course) => CourseE(
                      id: course.documentID,
                      name: course["name"] ?? null,
                      description: course["description"] ?? null,
                      color: course["color"],
                      videoPlaylistUrl: course["videoPlaylistUrl"] ?? null,
                      lessons: course["lessons"] ?? null,
                    ))
                .toList()));

        logger.info("initialized coursesE ${coursesE$}");
        return null;
      });
    });
  }

  @override
  Future<void> dispose() async {
    coursesE$.close();
  }
}
