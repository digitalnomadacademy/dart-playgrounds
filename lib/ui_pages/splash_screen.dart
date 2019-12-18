import 'dart:async';
import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _increaseOpacity = true;
  Widget _currentWidget;
  double _opacity = 0;
  Timer _timer;

  void newRouting() {
    Navigator.pushReplacementNamed(context, RouteName.homePage);
  }

  changeWidget() {
    _currentWidget.toString() == _EmptyWidget().toString()
        ? _currentWidget = _TextOne()
        : _currentWidget.toString() == _TextOne().toString()
            ? _currentWidget = _TextTwo()
            : _currentWidget.toString() == _TextTwo().toString()
                ? newRouting()
                : Container();
  }

  @override
  void initState() {
    _currentWidget = _EmptyWidget();
   _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
           setState(() {
              if (_increaseOpacity == true) {
                _opacity += 0.1;
              }
              if (_increaseOpacity == false) {
                _opacity -= 0.1;
              }
              if (_opacity > 0.9) {
                _increaseOpacity = false;
              }
              if (_opacity < 0.1) {
                _increaseOpacity = true;
                changeWidget();
              }
            });
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
        child: _currentWidget,
      )),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

class _TextOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "Mokuteki.io",
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class _TextTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "Dart Playgrounds",
      style: Theme.of(context).textTheme.display1,
    );
  }
}
