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
    return Consumer<SelectCourseA>(builder: (context, selectCourseA, child) {
      return ListTile(
        onTap: () {
          selectCourseA.selectCourse(courseO: courseO);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Consumer<ActiveCourseO>(
                      builder: (BuildContext context, ActiveCourseO value,
                          Widget child) {
                        return CoursePage(value.activeCourse);
                      },
                    )),
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
