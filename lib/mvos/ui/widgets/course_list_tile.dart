import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';

class CourseListTile extends StatelessWidget {
  final CourseO courseO;

  CourseListTile(this.courseO);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${courseO.name}',
        style: TextStyle(color: courseO.color),
      ),
      subtitle: Text('${courseO.description}'),
      trailing: CircularPercentIndicator(
        animation: true,
        animationDuration: 1500,
        radius: 40,
        percent: courseO.progress,
        center: Text('${(courseO.progress * 100.ceil()).toStringAsFixed(0)}%'),
        lineWidth: 4.0,
        backgroundColor: Colors.red,
        progressColor: Colors.green,
      ),
    );
  }
}
