import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/model/user_model.dart';
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RouteName.createCoursePage);
        },
      ),
      body: Consumer2<IsAdminO, CoursesO>(
        builder: (context, admin, model, child) => ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 2),
          itemCount: model.courses.length,
          itemBuilder: (context, index) {
            if (!admin.isAdmin)
              return buildAdminSlider(model, index);
            else
              return CourseListTile(model, index);
          },
        ),
      ),
    );
  }

  Widget buildAdminSlider(CoursesO model, int index) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Edit',
            color: Colors.pink,
            icon: Icons.edit,
            onTap: () {
              Navigator.pushNamed(context, RouteName.editCoursePage);
            },
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.deepPurpleAccent,
            icon: Icons.delete,
            onTap: () {
              _showDialog();
            },
          ),
        ],
        child: CourseListTile(model, index));
  }

  void _showDialog() {
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
                    Consumer<UserO>(
                        builder: (context, user, child) => FlatButton(
                              child: Text("Delete"),
                              onPressed: () {
                                if (user.email == controller.value.text)
                                  print("deleted");
                                else
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
