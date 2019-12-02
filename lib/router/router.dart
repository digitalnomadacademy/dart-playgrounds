import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mokuteki_io_playgrounds/ui/pages/home.dart';

class Router {
  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}

class RouteName {
  static const homePage = '/';
}
