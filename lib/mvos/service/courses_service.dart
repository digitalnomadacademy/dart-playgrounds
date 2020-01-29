import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class CoursesServices implements Disposable {
  final database = Firestore.instance;
  StreamController<CoursesE> _coursesO = StreamController<CoursesE>.broadcast();
  Stream<CoursesE> get coursesO => _coursesO.stream;

  PublishSubject<CourseE> courseE$ = PublishSubject<CourseE>();

 CoursesServices(){
   _initCourseE();
 }


  Future<void> _initCourseE() async {
    CollectionReference reference = database.collection('courses');
    reference.snapshots().listen((querySnapshot) {
      querySnapshot.documentChanges.forEach((course) {
        courseE$.add(CourseE(
          id: course.document.documentID,
          name: course.document["name"] ?? null,
          description: course.document["description"] ?? null,
          color: course.document["color"],
          videoPlaylistUrl: course.document["videoPlaylistUrl"] ?? null,
          lessons: course.document["lessons"] ?? null,
        ));
        logger.info("initialized courseE");
      });
    });
  }



  @override
  Future<void> dispose() async {
    _coursesO.close();
  }
}
