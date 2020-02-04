import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoursesE {
  final List<CourseE> courses;

  const CoursesE({
    @required this.courses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesE &&
          runtimeType == other.runtimeType &&
          courses == other.courses;

  @override
  int get hashCode => courses.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'courses': this.courses,
    };
  }

  factory CoursesE.fromMap(Map<String, dynamic> map) {
    return new CoursesE(
      courses: map['courses'] as List<CourseE>,
    );
  }
}

class CourseE {
  final String id;
  final String name;
  final String description;
  final Color color;
  final String videoPlaylistUrl;
  List<LessonE> lessons;

  CourseE({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.color,
    @required this.videoPlaylistUrl,
    @required this.lessons,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseE &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          color == other.color &&
          videoPlaylistUrl == other.videoPlaylistUrl &&
          lessons == other.lessons;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      color.hashCode ^
      videoPlaylistUrl.hashCode ^
      lessons.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'color': this.color.value,
      'videoPlaylistUrl': this.videoPlaylistUrl,
      'lessons': this.lessons,
    };
  }

  factory CourseE.fromMap(Map<String, dynamic> map, String id) {
    Iterable<LessonE> iterable = map['lessons'].map<LessonE>((lesson) {
      var lessonE = LessonE.fromMap(lesson);
      return lessonE;
    });
    List<LessonE> list = iterable.toList();
    return new CourseE(
      id: id,
      name: map['name'] as String,
      description: map['description'] as String,
      color: map['color'] != null ? Color(map['color']) : Colors.pink,
      videoPlaylistUrl: map['videoPlaylistUrl'] as String,
      lessons: list,
    );
  }
}

class LessonE {
  final String name;
  final String description;
  final String videoUrl;
  final String githubUrl;

  const LessonE({
    @required this.name,
    @required this.description,
    @required this.videoUrl,
    @required this.githubUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonE &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          videoUrl == other.videoUrl &&
          githubUrl == other.githubUrl;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      videoUrl.hashCode ^
      githubUrl.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'videoUrl': this.videoUrl,
      'githubUrl': this.githubUrl,
    };
  }

  factory LessonE.fromMap(Map<dynamic, dynamic> map) {
    return new LessonE(
      name: map['name'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      githubUrl: map['githubUrl'] as String,
    );
  }
}
