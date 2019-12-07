import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Copyright © Mokuteki.io'),
              ),
              InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text("Mokuteki")),
                          Text("Github",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('link')),
                        ])),
                onTap: () async {
                  if (await canLaunch(
                      "https://github.com/mokuteki-io/dart-playgrounds")) {
                    await launch(
                        "https://github.com/mokuteki-io/dart-playgrounds");
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "This app has been brought to you by Mokuteki.io Students:",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text("djkowa")),
                          Text("Github",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('link')),
                        ])),
                onTap: () async {
                  if (await canLaunch("https://github.com/djkowa")) {
                    await launch("https://github.com/djkowa");
                  }
                },
              ),
              InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text("lea88pu")),
                          Text("Github",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('link')),
                        ])),
                onTap: () async {
                  if (await canLaunch("https://github.com/lea88pu")) {
                    await launch("https://github.com/lea88pu");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
