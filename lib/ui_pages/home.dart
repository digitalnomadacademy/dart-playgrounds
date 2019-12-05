import 'package:flutter/material.dart';
import 'package:playground_app/observable_lessons/courses_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Mokuteki.io Playgrounds'),
          backgroundColor: Colors.pink,
          actions: <Widget>[
            MenuButton(),
          ],
        ),
        body: Center(
          child: Consumer<CoursesO>(
            builder: (context, o, child) =>
                Text('there are ${o.courses.length} courses available'),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}

class Drawer extends StatelessWidget {
  const Drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('About'),
          onPressed: () =>
              Navigator.pushNamed(context, RouteName.aboutPage),
        )
      ],
    );
  }
}
