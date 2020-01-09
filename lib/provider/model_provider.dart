import 'package:playground_app/mvos/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> models = [
  Provider<UserModel>(
    create: (context) =>
        UserModel(firebaseService: Provider.of(context, listen: false)),
    dispose: (context, UserModel model) => model.dispose(),
    lazy: false,
  )
];
