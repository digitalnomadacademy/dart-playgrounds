import 'package:flutter/material.dart';
import 'package:playground_app/widgets/courses_list.dart';
import 'package:playground_app/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Mokuteki.io Playgrounds'),
        backgroundColor: Colors.pink,
      ),
      body: CoursesList(),
    );
  }
}
