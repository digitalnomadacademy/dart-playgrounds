import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/ui/widgets/configurable_expansion_tile.dart';

class CourseSlivers extends StatelessWidget {
  ///Will be changed to [final ActiveCourseO course;]
  final CourseO course;

  CourseSlivers(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(title: Text(course.name)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    course.name,
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfigurableExpansionTile(
                    header: Text(
                      "Description",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(course.description)),
                      ConfigurableExpansionTile(
                        header: Text("Open video"),
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "VIDEO",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.9,
                            color: Colors.blue,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
