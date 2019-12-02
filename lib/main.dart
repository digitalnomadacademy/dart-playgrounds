import 'package:flutter/material.dart';
import 'package:mokuteki_io_playgrounds/provider/provider_main.dart';
import 'package:mokuteki_io_playgrounds/router/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        onGenerateRoute: Router.generator,
      ),
    );
  }
}
