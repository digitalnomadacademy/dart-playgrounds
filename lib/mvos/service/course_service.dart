import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  Future<String> getCourseID(String name) async {
    final reference = database.collection("courses");
    String id;
    await reference.where("name", isEqualTo: name).getDocuments().then((value) {
      id = value.documents.first.documentID;
    });
    return id;
  }

  void updateCourseData(String initialName,
      {String newName,
      description,
      videoPlaylistUrl,
      List lessons,
      int color}) async {
    final reference = database.collection("courses");
    final String id = await getCourseID(initialName);
    reference.document(id).updateData({
      "color": color,
      "description": description,
      "lessons": lessons,
      "name": newName,
      "videoPlaylistUrl": videoPlaylistUrl,
    });
  }

  @override
  Future<void> dispose() {
    return null;
  }
}
