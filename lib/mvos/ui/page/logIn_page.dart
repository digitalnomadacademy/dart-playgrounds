import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, RouteName.welcomePage),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
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
              color: Colors.pink,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
