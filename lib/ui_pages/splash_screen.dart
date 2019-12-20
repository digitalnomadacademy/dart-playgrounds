import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  String _fadingString;
  List<String> _strings = [
    "Mokuteki.io",
    "Dart Playgrounds",
    null,
  ];

  void newRouting() {
    Navigator.pushReplacementNamed(context, RouteName.homePage);
  }

  void changeString() {
    setState(() {
      _strings.removeAt(0);
      _fadingString = _strings.first;
      _controller.forward();
    });
  }

  @override
  void initState() {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Text(
              "$_fadingString",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ));
  }
}
