import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/ui/widgets/edit_course_form.dart';
import 'package:provider/provider.dart';

class EditCoursePage extends StatefulWidget {
  @override
  _EditCoursePageState createState() => _EditCoursePageState();
}

class _EditCoursePageState extends State<EditCoursePage> {
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
        body: Consumer<ActiveCourseO>(builder: (context, activeCourseO, child) {
          return EditCourseForm();
        }));
  }
}
