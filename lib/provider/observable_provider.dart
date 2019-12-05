

import 'package:playground_app/observable_lessons/courses_observable.dart';
import 'package:provider/provider.dart';

///Observables are immutable objects that can be consumed by the UI
List<SingleChildCloneableWidget> observables = [
  // COURSES
  Provider<CoursesO>.value(value: MockCoursesO.introduction),
];