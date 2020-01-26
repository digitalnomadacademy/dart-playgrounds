import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/model/user_model.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

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
          Divider(
            color: Colors.pink,
            thickness: 2,
          ),
          SizedBox(height: 400),
          Consumer<LogOutA>(
            builder: (context, o, _) => FlatButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Consumer<LoggedInO>(
                        builder: (context, data2, _) => Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      );
                    });
                if (Login == Login) {
                  o.logOut().then((_) {
                    Navigator.pushReplacementNamed(
                        context, RouteName.logInPage);
                  }).catchError((e) {
                    Navigator.pop(context);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                  });
                }
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
