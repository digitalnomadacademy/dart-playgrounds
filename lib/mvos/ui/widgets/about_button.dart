import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({
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
          'About',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
        onPressed: () {
          route != RouteName.aboutPage
              ? Navigator.pushNamed(context, RouteName.aboutPage)
              : Navigator.pop(context);
        },
      ),
    );
  }
}
