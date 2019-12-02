import 'package:flutter/material.dart';
import 'package:mokuteki_io_playgrounds/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      onGenerateRoute: Router.generator,
    );
  }
}
