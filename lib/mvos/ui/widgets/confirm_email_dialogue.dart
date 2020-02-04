import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class ConfirmEmailDialogue extends StatelessWidget {
  const ConfirmEmailDialogue({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 120,
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                'Please verify your email address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              elevation: 10,
              splashColor: Colors.tealAccent,
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(RouteName.logInPage, (Route<dynamic> route) => false);
              },
            ),
          )
        ]),
      ),
    );
  }
}
