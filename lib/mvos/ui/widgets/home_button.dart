import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key key,
    @required this.route,
  }) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: FlatButton(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
        onPressed: () {
          route != RouteName.homePage
              ? Navigator.pushNamed(context, RouteName.homePage)
              : Navigator.pop(context);
        },
      ),
    );
  }
}
