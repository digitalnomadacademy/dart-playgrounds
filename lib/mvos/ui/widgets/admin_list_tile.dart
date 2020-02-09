import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class AdminSlider extends StatelessWidget {
  final Widget child;
  final CourseO courseO;
  AdminSlider(this.child, this.courseO);
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectCourseA>(
//      stream: null,
        builder: (context, a, snapshot) {
      return Slidable(
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Edit',
              color: Colors.pink,
              icon: Icons.edit,
              onTap: () {
                a.selectCourse(courseO: courseO);
                Navigator.pushNamed(context, RouteName.editCoursePage);
              },
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.deepPurple,
              icon: Icons.delete,
              onTap: () {
                a.selectCourse(courseO: courseO);
                _showDialog(context);
              },
            ),
          ],
          child: child);
    });
  }

  void _showDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text("Enter your email to delete"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: controller,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Consumer3<UserO, ActiveCourseO, DeleteCourseA>(
                        builder: (context, userO, activeCourseO, deleteCourseA,
                                child) =>
                            FlatButton(
                              child: Text("Delete"),
                              onPressed: () {
                                if (userO.email == controller.value.text) {
                                  deleteCourseA.deleteCourse(
                                      name: activeCourseO.activeCourse.name);
                                  print("deleted");
                                } else
                                  Navigator.of(context).pop();
                              },
                            )),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
