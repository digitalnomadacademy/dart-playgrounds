import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playground_app/ui_pages/about_page.dart';
import 'package:playground_app/ui_pages/home.dart';
import 'package:playground_app/ui_pages/splash_screen.dart';

class Router {
  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: RouteSettings(name: '/'),
        );
      case RouteName.aboutPage:
        return MaterialPageRoute(
          builder: (_) => AboutPage(),
          settings: RouteSettings(name: '/aboutPage'),
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
