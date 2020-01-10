import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';



class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
        title: Text('Create Account'),
    leading: IconButton(icon:Icon(Icons.arrow_back),
    onPressed:() => Navigator.pop(context, RouteName.welcomePage),

      ),
    ));
  }
}
