import 'package:playground_app/mvos/model/courses_model.dart';
import 'package:playground_app/mvos/model/entity/courses_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoursesO {
  final List<CourseO> courses;

  const CoursesO({
    @required this.courses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesO &&
          runtimeType == other.runtimeType &&
          courses == other.courses;

  @override
  int get hashCode => courses.hashCode;
}

class CourseO {
  final String courseID;

  final String name;
  final String description;

  final int color;
  final List<LessonE> lessons;
  const CourseO({
    @required this.courseID,
    @required this.name,
    @required this.color,
    @required this.description,
    @required this.lessons,
  });

  @override
  bool operator ==(Object other) =>
      identical(
          this, other) ||
          other is CourseO &&
              runtimeType == other.runtimeType &&
              courseID == other.courseID &&
              name == other.name &&
              description == other.description &&
              color == other.color &&
              lessons == other.lessons;

  @override
  int get hashCode =>
      courseID.hashCode ^
      name.hashCode ^
      description.hashCode ^
      color.hashCode ^
      lessons.hashCode;



}



class CreateCourseA {
  final CreateCourse createCourse;

  const CreateCourseA({@required this.createCourse})
      : assert(createCourse != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CreateCourseA &&
              runtimeType == other.runtimeType &&
              createCourse == other.createCourse;

  @override
  int get hashCode => createCourse.hashCode;
}

class DeleteCourseA{
  final DeleteCourse deleteCourse;

  const DeleteCourseA({@required this.deleteCourse})
  :assert(deleteCourse !=null);

  @override
  bool operator ==(Object other) =>
      identical(
          this, other) ||
          other is DeleteCourseA &&
              runtimeType == other.runtimeType &&
              deleteCourse == other.deleteCourse;

  @override
  int get hashCode => deleteCourse.hashCode;

}
class UpdateCourseA{
  final UpdateCourse updateCourse;

  @override
  bool operator ==(Object other) =>
      identical(
          this, other) ||
          other is UpdateCourseA &&
              runtimeType == other.runtimeType &&
              updateCourse == other.updateCourse;

  @override
  int get hashCode => updateCourse.hashCode;

  const UpdateCourseA({@required this.updateCourse})
  :assert(updateCourse !=null);
}

class GetCourseA{
  final GetCourse getCourse;
  GetCourseA({@required this.getCourse})
  :assert(getCourse != null);

  @override
  bool operator ==(Object other) =>
      identical(
          this, other) ||
          other is GetCourseA &&
              runtimeType == other.runtimeType &&
              getCourse == other.getCourse;

  @override
  int get hashCode => getCourse.hashCode;

}