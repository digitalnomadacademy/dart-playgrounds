import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class CoursesService implements Disposable {
  final database = Firestore.instance;

  BehaviorSubject<CoursesE> coursesE$ = BehaviorSubject<CoursesE>();
  BehaviorSubject<CourseE> courseE$ = BehaviorSubject<CourseE>();

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
    }).catchError((e) => throw e);
  }

  void deleteCourse(String name) async {
    final reference = database.collection("courses");

    await reference.where("name", isEqualTo: name).getDocuments().then(
        (snapshot) => snapshot.documents.first.reference
            .delete()
            .catchError((e) => throw e));
  }

  void updateCourse(
    int color,
    String description,
    List lessons,
    String name,
    String videoPlaylistUrl,
  ) async {
    final reference = database.collection("courses");
    await reference
        .where("name", isEqualTo: name)
        .getDocuments()
        .then((snapshot) => snapshot.documents.first.reference.updateData({
              "color": color,
              "description": description,
              "lessons": lessons,
              "name": name,
              "videoPlaylistUrl": videoPlaylistUrl,
            }).catchError((e) => throw e));
  }

  void getCourse(
    String name,
  ) async {
    Future<String> courseId = database
        .collection('courses')
        .where("name", isEqualTo: name)
        .getDocuments()
        .then((doc) {
      String id = doc.documents.first.documentID;
      return id;
    });

    DocumentSnapshot courseDocument = await Firestore.instance
        .collection("courses")
        .document(await courseId)
        .get();

    courseE$.add(CourseE(
      id: courseDocument.documentID,
      name: courseDocument.data["name"] ?? null,
      description: courseDocument.data["description"] ?? null,
      color: courseDocument.data["color"] ?? null,
      videoPlaylistUrl: courseDocument.data["videoPlaylistUrl"] ?? null,
      lessons: CourseE.fromMap(courseDocument.data, courseDocument.documentID)
          .lessons,
    ));
    return;
  }

  @override
  Future<void> dispose() async {
    coursesE$.close();
    courseE$.close();
  }
}
