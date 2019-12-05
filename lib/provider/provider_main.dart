



import 'package:playground_app/provider/api_provider.dart';
import 'package:playground_app/provider/model_provider.dart';
import 'package:playground_app/provider/observable_provider.dart';
import 'package:provider/provider.dart';



List<SingleChildCloneableWidget> providers = [
  ...apis,
  ...models,
  ...observables
];