import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';


class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  _launchURL() async {
    const url = 'https://github.com/mokuteki-io/dart-playgrounds';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Copyright ©Mokuteki.io'),
                InkWell(
                  child: Text('Github link'),
                  onTap: _launchURL,

                ),
              ],
            ),
        ),
        ),
    );
  }
}
