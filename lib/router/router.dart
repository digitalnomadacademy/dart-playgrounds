import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playground_app/mvos/ui/page/about_page.dart';
import 'package:playground_app/mvos/ui/page/create_account_page.dart';
import 'package:playground_app/mvos/ui/page/create_course_page.dart';
import 'package:playground_app/mvos/ui/page/edit_course_page.dart';
import 'package:playground_app/mvos/ui/page/home.dart';
import 'package:playground_app/mvos/ui/page/logIn_page.dart';
import 'package:playground_app/mvos/ui/page/playground_page.dart';
import 'package:playground_app/mvos/ui/page/splash_screen.dart';
import 'package:playground_app/mvos/ui/page/welcome_page.dart';
import 'package:playground_app/mvos/ui/widgets/course_page.dart';

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
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case RouteName.logInPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LogInPage(),
        );
      case RouteName.welcomePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => WelcomePage(),
        );
      case RouteName.createAccountPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateAccountPage(),
        );

      case RouteName.playgroundPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => PlaygroundPage(),
        );
      case RouteName.createCoursePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateCoursePage(),
        );
      case RouteName.editCoursePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EditCoursePage(),
        );
      case RouteName.coursePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CoursePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}

class RouteName {
  static const homePage = '/';
  static const aboutPage = '/aboutPage';
  static const splashScreen = 'splashScreen';
  static const logInPage = 'welcome/login';
  static const welcomePage = 'welcome';
  static const createAccountPage = 'welcome/createAccount';
  static const playgroundPage = '/playground';
  static const createCoursePage = '/createCourse';
  static const editCoursePage = '/editCourse';
  static const coursePage = '/coursePage';
}
