import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';

// ignore: must_be_immutable
class CourseListTile extends StatefulWidget {
  CoursesO model;
  int index;

  CourseListTile(this.model, this.index);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.model.courses[widget.index].name}',
        style: TextStyle(color: widget.model.courses[widget.index].color),
      ),
      subtitle: Text('${widget.model.courses[widget.index].description}'),
      trailing: CircularPercentIndicator(
        animation: true,
        animationDuration: 1500,
        radius: 40,
        percent: widget.model.courses[widget.index].progress,
        center: Text(
            '${(widget.model.courses[widget.index].progress * 100.ceil()).toStringAsFixed(0)}%'),
        lineWidth: 4.0,
        backgroundColor: Colors.red,
        progressColor: Colors.green,
      ),
    );
    ;
  }
}
