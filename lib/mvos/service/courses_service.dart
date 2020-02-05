import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class CoursesService implements Disposable {
  final database = Firestore.instance;

  BehaviorSubject<CoursesE> coursesE$ = BehaviorSubject<CoursesE>();

  CoursesService() {
    _initCoursesE();
  }

  Future<void> _initCoursesE() async {
    CollectionReference reference = database.collection('courses');
    reference.snapshots().listen((coursesSnapshot) {
      List<CourseE> list =
          coursesSnapshot.documents.map((DocumentSnapshot courseSnapshot) {
        return CourseE.fromMap(courseSnapshot.data, courseSnapshot.documentID);
      }).toList();
      CoursesE coursesE = CoursesE(courses: list);
      coursesE$.add(coursesE);
      return null;
    });
  }

  @override
  Future<void> dispose() async {
    coursesE$.close();
  }
}
