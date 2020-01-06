import 'dart:async';

import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/shared/interfaces.dart';



class CoursesModel implements Disposable {
  StreamController<CoursesO> _coursesO = StreamController<CoursesO>.broadcast();
  Stream<CoursesO> get coursesO => _coursesO.stream;

  @override
  Future<void> dispose() async {
    _coursesO.close();
  }
}