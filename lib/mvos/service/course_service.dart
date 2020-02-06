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

  @override
  Future<void> dispose() {
    return null;
  }
}
