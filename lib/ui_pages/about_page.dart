import 'package:flutter/material.dart';
import 'package:mokuteki_playgrounds/widgets/drawer.dart';


import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       endDrawer: CustomDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
            backgroundColor: Colors.pink,
            title: Row(
              children: <Widget>[
                IconButton(alignment: Alignment.centerLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: ()=>Navigator.push(context,MaterialPageRoute(
                      builder: (context) => HomePage()
                  )
                  ),
                ),
                Text('About Page'),


              ],)
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
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
                            Image(image: AssetImage('images/GithubIcon.png'),),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child:
                              Text("Mokuteki"),
                            ),
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
                  width: 150,
                  height: 50,
                  child: Divider(color: Colors.pink,),
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
                            Image(image: AssetImage('images/GithubIcon.png'),),
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
                            Image(image: AssetImage('images/GithubIcon.png'),),
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
      ),
    );
  }
}