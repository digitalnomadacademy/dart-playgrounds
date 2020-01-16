import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  var _emailLoginController = TextEditingController();
  var _passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Form(
            key: formKey,
            child: Container(
              width: 350,
              child: TextFormField(
                controller: _emailLoginController,
                validator: (val) => !EmailValidator.validate(val, true)
                    ? 'Not a valid email.'
                    : null,
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
          Container(
            width: 350,
            child: TextFormField(
              controller: _passwordLoginController,
              validator: (value) {
                if (value.length < 5) {
                  return 'Password should have at least 6 characters';
                }
                return null;
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.keyboard),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  labelText: 'Password'),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          RaisedButton(
            onPressed: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
              }
            },
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
