import 'package:flutter/material.dart';
import 'package:mokuteki_playgrounds/router/router.dart';



class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      width: 200,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: FlatButton(
              child: Text('About',
                  style: TextStyle(fontSize: 20,
                  fontStyle: FontStyle.italic)
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteName.aboutPage),

            ),
          ),

        ],
      ),
    );
  }
}