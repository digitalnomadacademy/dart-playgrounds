import 'package:flutter/material.dart';
import 'package:playground_app/config/app_config.dart';
import 'package:playground_app/mvos/ui/widgets/playground_button.dart';
import 'package:playground_app/mvos/ui/widgets/about_button.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

import 'logout_button.dart';


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
          AboutButton(route: route,),
          kAppEnvironment == AppEnvironment.develop
              ? PlaygroundButton()
              : Container()
        ],
      child: Consumer<LoggedInO>(
        builder: (context, oLoggedIn, _) => Column(
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
            Divider(
              color: Colors.pink,
              thickness: 2,
            ),
            oLoggedIn.loggedIn ? LogOutButton() : Container(),
          ],
        ),
      ),
    );
  }
}
