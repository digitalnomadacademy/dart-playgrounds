import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  String _fadingString;
  List<String> _strings = [
    "Mokuteki.io",
    "Dart Playgrounds",
    null,
  ];

  @override
  void initState() {
    anonymousSignIn();
    _fadingString = _strings.first;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse().whenComplete(changeString);
      } else if (_fadingString == null) {
        _controller.stop();
        newRouting();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FadeTransition(
          opacity: _animation,
          child: Center(
            child: Text(
              "$_fadingString",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ],
    ));
  }

  Future anonymousSignIn() async {
    Provider.of<FirebaseService>(context, listen: false).signInAnonymously();
  }

  void newRouting() {
    bool _loggedIn = Provider.of<LoggedInO>(context, listen: false).loggedIn;
    _loggedIn == true
        ? Navigator.pushReplacementNamed(context, RouteName.homePage)
        : Navigator.pushReplacementNamed(context, RouteName.logInPage);
  }

  void changeString() {
    setState(() {
      _strings.removeAt(0);
      _fadingString = _strings.first;
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
