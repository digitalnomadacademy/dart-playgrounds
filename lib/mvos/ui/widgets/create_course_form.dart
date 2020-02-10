import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class CreateCourseForm extends StatefulWidget {
  @override
  _CreateCourseFormState createState() => _CreateCourseFormState();
}

class _CreateCourseFormState extends State<CreateCourseForm> {
  final CCformKey = GlobalKey<FormState>();

  ///Controllers
  var _courseNameController = TextEditingController();
  var _courseDescriptionController = TextEditingController();
  var _coursePlaylistURLController = TextEditingController();
  var list = List();
  Color _pickerColor = Color(0xff443a49);
  Color _currentColor = Color(0xff443a49);

  String _textFromUrl;
  int _colorValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: CCformKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 75,
                child: TextFormField(
                  controller: _courseNameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.text_fields),
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: 75,
                      child: TextFormField(
                        controller: _courseDescriptionController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.text_fields),
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attachment),
                    tooltip: "From TXT",
                    onPressed: () {
                      _showDialog(context);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 75,
                child: TextFormField(
                  controller: _coursePlaylistURLController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.video_library),
                    labelText: 'Video playlist URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      showColorPicker();
                    },
                    child: Icon(Icons.colorize),
                  ),
                  Consumer<CreateCourseA>(
                    builder: (context, createCourseA, child) {
                      return RaisedButton(
                        child: Text("Add course"),
                        onPressed: () {
                          if (_courseDescriptionController.text.length > 5 &&
                              _courseNameController.text.length > 5 &&
                              isURL(_coursePlaylistURLController.text)) {
                            createCourseA.createCourse(
                              color: _colorValue,
                              description: _textFromUrl != null
                                  ? _textFromUrl
                                  : _courseDescriptionController.text,
                              lessons: list,
                              name: _courseNameController.text,
                              videoPlaylistUrl:
                                  _coursePlaylistURLController.text,
                            );
                            Navigator.of(context).pop();
                          } else {
                            print("error");
                          }
                        },
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text("Enter Pastebin URL"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: controller,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("Add url"),
                      onPressed: () {
                        downloadFile(controller.text);
                      },
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }

  isUrlValid(String url) {
    if (isURL(url) && url.contains("pastebin.com")) {
      convertURL(url);
      Navigator.of(context).pop();
    } else
      Navigator.of(context).pop();
  }

  convertURL(String url) {
    if (!url.contains("raw")) {
      url = url.replaceFirst(RegExp('.com/'), '.com/raw/', 0);
      return url;
    } else
      return url;
  }

  downloadFile(String url) async {
    isUrlValid(url);
    HttpClient client = new HttpClient();
    client
        .getUrl(Uri.parse("https://pastebin.com/raw/wXdBG5NU"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {
        _textFromUrl = contents;
        _courseDescriptionController.text = "Added from pastebin";
      });
    });
  }

  void showColorPicker() {
    void changeColor(Color color) {
      setState(() => _pickerColor = color);
    }

    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _pickerColor,
            onColorChanged: changeColor,
            enableLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Done'),
            onPressed: () {
              setState(() {
                _currentColor = _pickerColor;
                _colorValue = _currentColor.value;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
