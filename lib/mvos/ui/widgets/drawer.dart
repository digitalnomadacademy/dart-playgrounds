import 'package:flutter/material.dart';
import 'package:playground_app/config/app_config.dart';
import 'package:playground_app/router/router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context).settings.name;
    return Container(
      color: Colors.white,
      width: 200,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: FlatButton(
              child: Text(
                'About',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                route != RouteName.aboutPage
                    ? Navigator.pushNamed(context, RouteName.aboutPage)
                    : Navigator.pop(context);
              },
            ),
          ),
          Divider(color: Colors.pink,thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: FlatButton(
              child: Text(
                'Playground',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                kAppEnvironment != AppEnvironment.develop
                    ? Navigator.pushNamed(context, RouteName.playgroundPage)
                    : Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
