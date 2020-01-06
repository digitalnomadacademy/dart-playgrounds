import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:provider/provider.dart';

class CoursesList extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesO>(
      builder: (context, model, child) => ListView.separated(
        separatorBuilder: (context, index) => Divider(thickness: 2),
        itemCount: model.courses.length,
        itemBuilder: (
          context,
          index,
        ) {
          return ListTile(
            title: Text(
              '${model.courses[index].name}',
              style: TextStyle(color: model.courses[index].color),
            ),
            subtitle: Text('${model.courses[index].description}'),
            trailing: CircularPercentIndicator(
              radius: 40,
              percent: model.courses[index].progress,
              center: Text('${(model.courses[index].progress*100.ceil()).toStringAsFixed(0)}%'),
              lineWidth: 4.0,
              progressColor: Colors.pink,
            ),
          );
        },
      ),
    );
  }
}
