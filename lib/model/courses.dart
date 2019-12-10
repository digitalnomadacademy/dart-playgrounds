import 'dart:async';

import 'package:mokuteki_playgrounds/observable_lessons/courses_observable.dart';
import 'package:mokuteki_playgrounds/shared/interfaces.dart';




class CoursesModel implements Disposable {
  StreamController<CoursesO> _coursesO = StreamController<CoursesO>.broadcast();
  Stream<CoursesO> get coursesO => _coursesO.stream;

  @override
  Future<void> dispose() async {
    _coursesO.close();
  }
}