import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playground_app/mvos/ui/page/about_page.dart';
import 'package:playground_app/mvos/ui/page/home.dart';
import 'package:playground_app/mvos/ui/page/splash_screen.dart';

class Router {
  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(),
        );
      case RouteName.aboutPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AboutPage(),
        );
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}

class RouteName {
  static const homePage = '/';
  static const aboutPage = '/aboutPage';
  static const splashScreen = "splashScreen";
}
