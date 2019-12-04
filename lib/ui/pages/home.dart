import 'package:flutter/material.dart';
import 'package:mokuteki_playgrounds/observable/lessons/courses_observable.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CoursesO>(
          builder: (context, o, child) =>
              Text('there are ${o.courses.length} courses available'),
        ),
      ),
    );
  }
}
