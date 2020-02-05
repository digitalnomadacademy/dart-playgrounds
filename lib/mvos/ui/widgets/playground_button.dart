import 'package:flutter/material.dart';
import 'package:playground_app/config/app_config.dart';
import 'package:playground_app/router/router.dart';

class PlaygroundButton extends StatelessWidget {
  const PlaygroundButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(color: Colors.pink,thickness: 2,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: FlatButton(
            child: Text(
              'Playground',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            onPressed: () {
              kAppEnvironment == AppEnvironment.develop
                  ? Navigator.pushNamed(context, RouteName.playgroundPage)
                  : Container();
            },
          ),
        ),
      ],
    );
  }
}
