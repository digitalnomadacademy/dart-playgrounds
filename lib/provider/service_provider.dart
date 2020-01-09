import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

///APIS are part of the app that are calling external APIS.
///They can be network calls to other services, or calls to local storage
List<SingleChildWidget> services = [
  Provider<FirebaseService>(
    create: (context) => FirebaseService(),
    dispose: (context, FirebaseService service) => service.dispose(),
    lazy: false, // to create them immediately
  )
];
