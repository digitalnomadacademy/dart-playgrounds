import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final formKey = GlobalKey<FormState>();

  var _nameController = TextEditingController();
  var _surnameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();
  var _codeController = TextEditingController();

  var _surnameFocusNode = FocusNode();
  var _phoneFocusNode = FocusNode();
  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  var _repeatPasswordFocusNode = FocusNode();
  var _codeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _surnameFocusNode.requestFocus(),
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Please enter more text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _surnameFocusNode,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _phoneFocusNode.requestFocus(),
                  controller: _surnameController,
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Please enter more text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Surname',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _phoneFocusNode,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _emailFocusNode.requestFocus(),
                  controller: _phoneController,
                  validator: (value) {
                    if (value.length < 8) {
                      return 'Please enter more number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Telephone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailController,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _passwordFocusNode.requestFocus(),
                  validator: (value) =>
                      !value.contains('@') ? 'Not a valid Email' : null,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () =>
                      _repeatPasswordFocusNode.requestFocus(),
                  controller: _passwordController,
                  validator: (value) {
                    if (value.length < 5) {
                      return 'Password should have at least 6 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.keyboard),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _repeatPasswordFocusNode,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _codeFocusNode.requestFocus(),
                  controller: _repeatPasswordController,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Password is not matching';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.keyboard),
                    labelText: 'RepeatPassword',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _codeFocusNode,
                  controller: _codeController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Code(optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Consumer<AccountO>(
                builder: (context, o, _) => Container(
                  width: 180,
                  height: 50,
                  child: RaisedButton(
                    //this will be block function instead of arrow,
                    // because you will first validate form
                    // before sending the data trough observable.
                    // only if observable future gets resolved,
                    // you will push new route
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            );
                          });
                      await loginAction();
                      if (formKey.currentState.validate()) {
                        o.createAccount().then((_) {
                          Navigator.of(context)
                              .popAndPushNamed(RouteName.homePage);
                        }).catchError((e) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e),
                          ));
                        });
//                        call o.createAccount(name:_controller.name,....
                      } else
                        Navigator.pop(context);
                    },

                    child: Text(
                      'Create account',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> loginAction() async {
  //replace the below line of code with your login request
  await new Future.delayed(const Duration(seconds: 2));
  return true;
}
