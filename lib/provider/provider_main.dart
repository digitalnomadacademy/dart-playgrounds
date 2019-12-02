import 'package:mokuteki_io_playgrounds/provider/api_provider.dart';
import 'package:provider/provider.dart';

import 'model_provider.dart';

List<SingleChildCloneableWidget> provide = [
  ...apis,
  ...models,
];