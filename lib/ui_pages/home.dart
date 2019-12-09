import 'package:flutter/material.dart';
import 'package:playground_app/observable_lessons/courses_observable.dart';
import 'package:playground_app/widgets/drawer.dart';
import 'package:playground_app/widgets/menu_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
endDrawer: CustomDrawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text('Mokuteki.io Playgrounds')),
            backgroundColor: Colors.pink,
            actions: <Widget>[

            ],
          ),
          body: Center(
            child: Consumer<CoursesO>(
              builder: (context, o, child) =>
                  Text('there are ${o.courses.length} courses available'),
            ),
          ),
        ),
      ),
    );
  }
}
