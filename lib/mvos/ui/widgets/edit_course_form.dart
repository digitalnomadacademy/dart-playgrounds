import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:provider/provider.dart';

class EditCourseForm extends StatefulWidget {
  @override
  _EditCourseFormState createState() => _EditCourseFormState();
}

class _EditCourseFormState extends State<EditCourseForm> {
  var _courseNameController = TextEditingController();
  var _courseDescriptionController = TextEditingController();
  var _coursePlaylistURLController = TextEditingController();
  Color _pickerColor = Color(0xff443a49);
  Color _currentColor = Color(0xff443a49);

  int _colorValue = Colors.pink.value;

  @override
  Widget build(BuildContext context) {
    return Consumer<ActiveCourseO>(builder: (context, activeCourseO, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 75,
                child: TextFormField(
                  controller: _courseNameController
                    ..text = (activeCourseO.activeCourse.name),
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
                        controller: _courseDescriptionController
                          ..text = (activeCourseO.activeCourse.description),
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
//                    _showDialog(context);
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
                  controller: _coursePlaylistURLController
                    ..text = (activeCourseO.activeCourse.videoPlaylistUrl),
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
                  Consumer<UpdateCourseA>(builder: (context, updateCourseA, c) {
                    return RaisedButton(
                      child: Icon(Icons.save),
                      onPressed: () {
                        updateCourseA.updateCourse(
                          color: _colorValue,
                          newName: _courseNameController.text,
                          videoPlaylistUrl: _coursePlaylistURLController.text,
                          courseID: activeCourseO.activeCourse.courseID,
                          description: _courseDescriptionController.text,
                          lessons: List(),
                        );
                        Navigator.of(context).pop();
                      },
                    );
                  })
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      );
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
