



import 'package:playground_app/provider/model_provider.dart';
import 'package:playground_app/provider/observable_provider.dart';
import 'package:playground_app/provider/service_provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ...services,
  ...models,
  ...observables
];