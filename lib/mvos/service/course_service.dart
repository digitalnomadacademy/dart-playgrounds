import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/shared/interfaces.dart';

class CourseService implements Disposable {
  final database = Firestore.instance;

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

  getCourseID(String name) async {
    final reference = database.collection("courses");
    reference.where("name", isEqualTo: name).getDocuments().then((value) {
      return value.documents.first.documentID;
    });
  }

  @override
  Future<void> dispose() {
    return null;
  }
}
