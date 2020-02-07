import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  void addCourse(
      int color,
      String description,
      List lessons,
      String name,
      String videoPlaylistUrl,
      ) async {
    final reference = database.collection("courses");
    await reference.document().setData({
      "color": color,
      "description": description,
      "lessons": lessons,
      "name": name,
      "videoPlaylistUrl": videoPlaylistUrl,
    });
  }

  void deleteCourse(
      String name,
      ) async {
    final reference = database.collection("courses");

    reference
        .where("name", isEqualTo: name)
        .getDocuments()
        .then((snapshot) => snapshot.documents.first.reference.delete());
  }

  @override
  Future<void> dispose() async {
    coursesE$.close();
  }
}
