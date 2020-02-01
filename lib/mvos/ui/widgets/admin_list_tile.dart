import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class AdminSlider extends StatelessWidget {
  final Widget child;

  AdminSlider(this.child);

  @override
  Widget build(BuildContext context) {
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
              _showDialog(context);
            },
          ),
        ],
        child: child);
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
                    Consumer<UserO>(
                        builder: (context, userO, child) => FlatButton(
                              child: Text("Delete"),
                              onPressed: () {
                                if (userO.email == controller.value.text)
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
