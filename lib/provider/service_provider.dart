import 'package:playground_app/mvos/service/courses_service.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:playground_app/mvos/service/secure_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

///APIS are part of the app that are calling external APIS.
///They can be network calls to other services, or calls to local storage
List<SingleChildWidget> services = [
  Provider<UserService>(
    create: (context) => UserService(),
    dispose: (context, UserService service) => service.dispose(),
    lazy: false, // to create them immediately
  ),
  Provider<CoursesService>(
    create: (context) => CoursesService(),
    dispose: (context, CoursesService service) => service.dispose(),
    lazy: false, // to create them immediately
  ),
  Provider<SecureStorageService>(
    create: (context) => SecureStorageService(),
    dispose: (context, SecureStorageService service) => service.dispose(),
    lazy: false, // to create them immediately
  ),

];
