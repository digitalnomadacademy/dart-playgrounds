import 'package:flutter/material.dart';
import 'package:playground_app/mvos/ui/widgets/create_course_form.dart';
import 'package:provider/provider.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  _CreateCoursePageState createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit course'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: CreateCourseForm());
// change this,only leave lessons: List()
  }
}
