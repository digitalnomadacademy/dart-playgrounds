




import 'package:mokuteki_playgrounds/provider/api_provider.dart';
import 'package:mokuteki_playgrounds/provider/model_provider.dart';
import 'package:mokuteki_playgrounds/provider/observable_provider.dart';
import 'package:provider/provider.dart';



List<SingleChildCloneableWidget> providers = [
  ...apis,
  ...models,
  ...observables
];