import 'package:playground_app/mvos/model/course_model.dart';
import 'package:playground_app/mvos/model/user_model.dart';
import 'package:playground_app/mvos/model/courses_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> models = [
  Provider<UserModel>(
    create: (context) =>
        UserModel(firebaseService: Provider.of(context, listen: false)),
    dispose: (context, UserModel model) => model.dispose(),
    lazy: false,
  ),

  Provider<CoursesModel>(
    create: (context) =>
        CoursesModel(coursesService : Provider.of(context, listen: false)),
    dispose: (context, CoursesModel model) => model.dispose(),
    lazy: false,
  ),

  Provider<CourseModel>(
    create: (context)=>
    CourseModel(courseService: Provider.of(context,listen: false)),
    dispose: (context, CourseModel model)=> model.dispose(),
    lazy: false,
  )
];
