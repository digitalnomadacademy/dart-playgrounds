import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/service/course_service.dart';
import 'package:provider/provider.dart';

class EditCourseForm extends StatefulWidget {
  @override
  _EditCourseFormState createState() => _EditCourseFormState();
}

class _EditCourseFormState extends State<EditCourseForm> {
  var _courseNameController = TextEditingController();
  var _courseDescriptionController = TextEditingController();
  var _coursePlaylistURLController = TextEditingController();
  CourseService courseService = CourseService();
  String initialName;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ActiveCourseO>(context).activeCourse.name != "A") {
      initialName = Provider.of<ActiveCourseO>(context).activeCourse.name;
      print(initialName);
    }
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
              RaisedButton(
                onPressed: () {
//                showColorPicker();
                },
                child: Icon(Icons.colorize),
              ),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                child: Icon(Icons.mode_edit),
                onPressed: () {
                  courseService.updateCourseData(initialName);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
