import 'package:flutter/material.dart';
import 'package:playground_app/mvos/ui/widgets/loginPage_form.dart';
import 'package:playground_app/router/router.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, RouteName.welcomePage),
        ),
      ),
      body: LoginForm(),
    );
  }
}
