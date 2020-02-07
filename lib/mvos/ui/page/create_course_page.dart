import 'package:flutter/material.dart';
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
      body: Consumer<DeleteCourseA>(
          builder: (context,action,_)=>
              FloatingActionButton(onPressed: ()=> action.deleteCourse(

                name : "name",

              ),
              ),));
// change this,only leave lessons: List()
  }
}
