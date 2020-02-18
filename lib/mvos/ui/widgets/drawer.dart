import 'package:flutter/material.dart';
import 'package:playground_app/config/app_config.dart';
import 'package:playground_app/mvos/ui/widgets/home_button.dart';
import 'package:playground_app/mvos/ui/widgets/logout_button.dart';
import 'package:playground_app/mvos/ui/widgets/playground_button.dart';
import 'package:playground_app/mvos/ui/widgets/about_button.dart';
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
          AboutButton(
            route: route,
          ),
          kAppEnvironment == AppEnvironment.develop
              ? PlaygroundButton()
              : Container(),
          HomeButton(
            route: RouteName.homePage,
          ),
          LogOutButton(
          )
        ],
      ),
    );
  }
}
