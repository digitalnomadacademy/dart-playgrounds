import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatelessWidget {
  CoursePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ActiveCourseO>(
        builder: (context, activeCourseO, child) => CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text(activeCourseO.activeCourse.name),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        activeCourseO.activeCourse.description,
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                          onTap: () {
                            _launchURL(
                                activeCourseO.activeCourse.videoPlaylistUrl);
                          },
                          child:
                              Text(activeCourseO.activeCourse.videoPlaylistUrl))
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
      ),
    );
  }

  _launchURL(String url) async {
    if (!url.contains("http")) url = "https://" + url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
