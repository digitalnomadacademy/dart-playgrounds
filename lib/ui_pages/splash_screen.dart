import 'dart:async';
import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool start = true;
  bool positiveNegative = true;
  bool stopTimer;
  Widget mainWidget;
  double _opacity = 0;

  Widget emptyWidget() {
    return Text("");
  }

  Widget textOne() {
    return Text(
      "Mokuteki.io",
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }

  Widget textTwo() {
    return Text(
      "Dart Playgrounds",
      style: TextStyle(fontSize: 40),
    );
  }

  Widget newRouting() {
    stopTimer = true;
    Navigator.pushReplacementNamed(context, RouteName.homePage);

  }

  changeWidget() {
    mainWidget.toString() == emptyWidget().toString()
        ? mainWidget = textOne()
        : mainWidget.toString() == textOne().toString()
        ? mainWidget = textTwo()
        : mainWidget.toString() == textTwo().toString()
        ? mainWidget = newRouting()
        : stopTimer = true;
  }

  @override
  void initState() {
    mainWidget = emptyWidget();
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      stopTimer == true
          ? timer.cancel()
          : setState(() {
        if (positiveNegative == true) {
          _opacity += 0.1;
        }
        if (positiveNegative == false) {
          _opacity -= 0.1;
        }
        if (_opacity > 0.9) {
          positiveNegative = false;
        }
        if (_opacity < 0.1) {
          positiveNegative = true;
          changeWidget();
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
      ),
      body: Center(
          child: Opacity(
            opacity: _opacity,
            child: mainWidget,
          )),
    );
  }
}
