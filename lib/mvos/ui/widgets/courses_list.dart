import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/model/user_model.dart';
import 'package:playground_app/mvos/ui/widgets/admin_list_tile.dart';
import 'package:playground_app/mvos/ui/widgets/course_list_tile.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class CoursesList extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: Consumer<IsAdminO>(
        builder: (context, isAdminO, child) => isAdminO.isAdmin
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.createCoursePage);
                },
              )
            : Container(),
      ),
      body: Consumer2<IsAdminO, CoursesO>(
        builder: (context, isAdminO, coursesO, child) => ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 2),
          itemCount: coursesO.courses.length,
          itemBuilder: (context, index) {
            if (isAdminO.isAdmin)
              return AdminSlider(CourseListTile(coursesO.courses[index]));
            else
              return CourseListTile(coursesO.courses[index]);
          },
        ),
      ),
    );
  }
}
