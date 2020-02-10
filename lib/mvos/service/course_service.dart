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

  void updateCourseData(String courseID,
      {String newName,
      description,
      videoPlaylistUrl,
      List lessons,
      int color}) async {
    final reference = database.collection("courses");
    reference.document(courseID).updateData({
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
