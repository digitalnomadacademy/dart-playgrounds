import 'package:flutter/material.dart';
import 'package:playground_app/mvos/ui/widgets/courses_list.dart';
import 'package:playground_app/mvos/ui/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
        backgroundColor: Colors.pink,
      ),
      body: CoursesList(),
    );
  }
}
