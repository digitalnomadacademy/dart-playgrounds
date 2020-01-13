import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

///Observables are immutable objects that can be consumed by the UI
List<SingleChildWidget> observables = [
//   COURSES
  Provider<CoursesO>(create: (context) => MockCoursesO.introduction),
//   USER
  StreamProvider<LoggedInO>(
    initialData: LoggedInO(loggedIn: false),
    catchError: (context, error) => LoggedInO(loggedIn: false),
    create: (context) =>
        Provider.of<UserModel>(context, listen: false).loggedInO$,
  ),
  Provider<LoginO>(
    create: (context) => Provider.of<UserModel>(context, listen: false).loginO,
  ),
  Provider<AccountO>(
    create: (context) =>
        Provider.of<UserModel>(context, listen: false).accountO,
  )
];
