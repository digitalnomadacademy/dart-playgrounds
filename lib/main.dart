import 'package:flutter/material.dart';
import 'package:playground_app/provider/provider_main.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        onGenerateRoute: Router.generator,
        initialRoute: RouteName.splashScreen,
      ),
    );
  }
}

