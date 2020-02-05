import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LogOutA>(
      builder: (context, oLogOut, _) => Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.pink,
                      ),
                    );
                  });
              oLogOut.logOut().then((_) {
                Navigator.pushReplacementNamed(context, RouteName.logInPage);
              }).catchError((e) {
                Navigator.pop(context);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(e.toString()),
                ));
              });
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
