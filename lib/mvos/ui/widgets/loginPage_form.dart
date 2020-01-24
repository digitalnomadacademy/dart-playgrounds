import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //Form global key
  final formKey = GlobalKey<FormState>();

  //Controllers
  var _emailLoginController = TextEditingController();
  var _passwordLoginController = TextEditingController();

  //Focus Nodes
  var _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),

                //Email FormField
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _emailLoginController,
                    textInputAction: TextInputAction.go,
                    onEditingComplete: () => _passwordFocusNode.requestFocus(),
                    validator: (value) =>
                        !value.contains('@') ? 'Not a valid Email' : null,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        labelText: 'Email'),
                  ),
                ),
                SizedBox(height: 24),

                //Password FormField
                Container(
                  width: 350,
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    controller: _passwordLoginController,
                    validator: (value) {
                      if (value.length < 5) {
                        return 'Password should have at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.keyboard),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        labelText: 'Password'),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Consumer<LoginA>(
                  builder: (context, o, _) => Container(
                    width: 180,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
//                    show spinning circle dialog, while we wait for the future
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                              );
                            });

                        if (formKey.currentState.validate()) {
//                      try login
                          o
                              .login(
                                  email: _emailLoginController.text,
                                  password: _passwordLoginController.text)
                              .then((_) {
//                        if succeed, route.
                            Navigator.of(context)
                                .popAndPushNamed(RouteName.homePage);
                          }).catchError((e) {
                            Navigator.pop(context);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
//                        content: Text(e),
                            ));
                          });
//                        call o.createAccount(name:_controller.name,....
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
