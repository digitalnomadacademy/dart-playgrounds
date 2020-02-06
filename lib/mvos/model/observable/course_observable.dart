import 'package:playground_app/mvos/model/course_model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
