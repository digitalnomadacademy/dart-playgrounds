import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/ui/widgets/course_page.dart';
import 'package:provider/provider.dart';

class CourseListTile extends StatelessWidget {
  final CourseO courseO;

  CourseListTile(this.courseO);

  @override
  Widget build(BuildContext context) {
    return Consumer2<SelectCourseA, ActiveCourseO>(
        builder: (context, selectCourseA, activeCourseO, child) {
      return ListTile(
        onTap: () {
          selectCourseA.selectCourse(courseO: courseO);
          print(activeCourseO.activeCourse.description + "val");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CoursePage(activeCourseO.activeCourse)),
          );
        },
        title: Text(
          "${courseO.name}",
          style: TextStyle(color: courseO.color),
        ),
        subtitle: Text("${courseO.description}"),
      );
    });
  }
}
