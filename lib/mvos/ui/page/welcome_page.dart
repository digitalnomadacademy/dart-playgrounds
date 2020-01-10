import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Playgrounds',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 180,
              height: 50,
              child: RaisedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteName.logInPage),
                color: Colors.pink,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 180,
              height: 50,
              child: RaisedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteName.createAccountPage),
                color: Colors.pink,
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
