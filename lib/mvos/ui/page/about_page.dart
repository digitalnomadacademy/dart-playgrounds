import 'package:flutter/material.dart';
import 'package:playground_app/mvos/ui/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Copyright ©️ Mokuteki.io'),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/GithubIcon.png'),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text("Mokuteki"),
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  if (await canLaunch(
                      "https://github.com/mokuteki-io/dart-playgrounds")) {
                    await launch(
                        "https://github.com/mokuteki-io/dart-playgrounds");
                  }
                },
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: Divider(
                  color: Colors.pink,
                ),
              ),
              FittedBox(
                child: Text(
                  "This app has been brought to you by Mokuteki.io Students:",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/GithubIcon.png'),
                      Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("djkowa")),
                    ],
                  ),
                ),
                onTap: () async {
                  if (await canLaunch("https://github.com/djkowa")) {
                    await launch("https://github.com/djkowa");
                  }
                },
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/GithubIcon.png'),
                      Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("lea88pu")),
                    ],
                  ),
                ),
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


