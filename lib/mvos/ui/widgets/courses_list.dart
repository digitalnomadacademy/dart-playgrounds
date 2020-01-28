import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class CoursesList extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
//    bool _isAdmin = Provider.of<IsAdminO>(context, listen: false).isAdmin;
    bool _isAdmin = true;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RouteName.createCoursePage);
        },
      ),
      body: Consumer<CoursesO>(
        builder: (context, model, child) => ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 2),
          itemCount: model.courses.length,
          itemBuilder: (context, index) {
            if (_isAdmin)
              return buildAdminSlider(model, index);
            else
              return courseTile(model, index);
          },
        ),
      ),
    );
  }

  Widget courseTile(CoursesO model, int index) {
    return ListTile(
      title: Text(
        '${model.courses[index].name}',
        style: TextStyle(color: model.courses[index].color),
      ),
      subtitle: Text('${model.courses[index].description}'),
      trailing: CircularPercentIndicator(
        animation: true,
        animationDuration: 1500,
        radius: 40,
        percent: model.courses[index].progress,
        center: Text(
            '${(model.courses[index].progress * 100.ceil()).toStringAsFixed(0)}%'),
        lineWidth: 4.0,
        backgroundColor: Colors.red,
        progressColor: Colors.green,
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
        child: courseTile(model, index));
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
                    FlatButton(
                      child: Text("Delete"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
