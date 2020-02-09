import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:provider/provider.dart';

class EditCourseForm extends StatefulWidget {
  @override
  _EditCourseFormState createState() => _EditCourseFormState();
}

class _EditCourseFormState extends State<EditCourseForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActiveCourseO>(builder: (context, activeCourseO, child) {
      return Center(
        child: Container(
          child: Text(activeCourseO.activeCourse.name),
        ),
      );
    });
  }
}
