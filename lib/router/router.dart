import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playground_app/ui_pages/about_page.dart';
import 'package:playground_app/ui_pages/home.dart';





class Router {
  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.aboutPage:
        return MaterialPageRoute (builder: (_) => AboutPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}

class RouteName {
  static const homePage = '/';
  static const aboutPage = '/aboutPage';
}