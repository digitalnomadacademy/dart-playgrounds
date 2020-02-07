import 'package:playground_app/mvos/model/courses_model.dart';
import 'package:playground_app/mvos/model/course_model.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

///Observables are immutable objects that can be consumed by the UI
List<SingleChildWidget> observables = [
//   COURSES
  // Provider<CoursesO>(create: (context) => MockCoursesO.introduction),
  StreamProvider<CoursesO>(
    initialData: CoursesO(courses: List<CourseO>()),
    create: (context) =>
        Provider.of<CoursesModel>(context, listen: false).coursesO$,
  ),

//   USER
  StreamProvider<LoggedInO>(
    initialData: LoggedInO(loggedIn: false),
    catchError: (context, error) => LoggedInO(loggedIn: false),
    create: (context) =>
        Provider.of<UserModel>(context, listen: false).loggedInO$,
  ),

  StreamProvider<IsAdminO>(
    initialData: IsAdminO(isAdmin: false),
    create: (context) =>
        Provider.of<UserModel>(context, listen: false).isAdminO$,
  ),
  StreamProvider<UserO>(
    create: (context) => Provider.of<UserModel>(context, listen: false).userO$,
  ),

  Provider<LoginA>(
    create: (context) => Provider.of<UserModel>(context, listen: false).loginA,
  ),
  Provider<CreateAccountA>(
    create: (context) =>
        Provider.of<UserModel>(context, listen: false).createAccountA,
  ),
  Provider<LogOutA>(
    create: (context) => Provider.of<UserModel>(context, listen: false).logOutA,
  ),

  Provider<CreateCourseA>(
    create: (context) =>
        Provider.of<CourseModel>(context, listen: false).createCourseA,
  )
];
