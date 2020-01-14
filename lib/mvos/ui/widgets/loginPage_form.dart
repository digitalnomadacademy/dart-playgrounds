import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Form(
            child: Container(
              width: 350,
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: 'Email*'),
              ),
            ),
          ),
          SizedBox(height: 24),
          RaisedButton(
            onPressed: () => Navigator.pushNamed(context, RouteName.homePage),
            child: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
