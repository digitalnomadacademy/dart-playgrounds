import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';

class CoursePage extends StatelessWidget {
  ///Will be changed to [final ActiveCourseO course;]
  final CourseO course;

  CoursePage(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text(course.name),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      course.description,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("url")
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(buildLessons()),
          )
        ],
      ),
    );
  }
}

buildLessons() {
  List<Widget> listItems = List();

  for (int i = 0; i < 30; i++) {
    listItems.add(Card(
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text('Lesson ${i.toString()}',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0)),
      ),
    ));
  }

  return listItems;
}
