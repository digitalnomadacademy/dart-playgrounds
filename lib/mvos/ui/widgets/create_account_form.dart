import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  //Form Global Key
  final formKey = GlobalKey<FormState>();



  //Controllers
  var _nameController = TextEditingController();
  var _surnameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();
  var _codeController = TextEditingController();

  //Focus Nodes
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

              //Name FormField
              Container(
                height: 50,
                child: TextFormField(

                  controller: _nameController,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _surnameFocusNode.requestFocus(),
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Please enter some text';
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

              //Surname FormField
              Container(
                height: 50,
                child: TextFormField(

                  focusNode: _surnameFocusNode,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _phoneFocusNode.requestFocus(),
                  controller: _surnameController,
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Please enter some text';
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

              //Phone FormField
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _phoneFocusNode,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () => _emailFocusNode.requestFocus(),
                  controller: _phoneController,
                  validator: (value) {
                    if (value.length < 8) {
                      return 'Please enter your phone number';
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

              //Email FormField
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

              //Password FormField
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

              //Repeat Password Field
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

              //Code FormField
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
              Consumer<CreateAccountA>(
                builder: (context, o, _) => Container(
                  width: 180,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
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
                        o
                            .createAccount(
                                name: _nameController.text,
                                surname: _surnameController.text,
                                courseCode: _codeController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
                                password: _passwordController.text)
                            .then((_) async {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => Align(
                                child: Card(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Text(
                                                    'Please verify your email address'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RaisedButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .popAndPushNamed(
                                                          RouteName.logInPage);
                                                },
                                              ),
                                            )
                                          ]),
                                    ),
                              ));
                        }).catchError((e) {
                          Navigator.pop(context);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString()),
                          ));
                        });
//                        call o.createAccount(name:_controller.name,....
                      } else {
                        Navigator.pop(context);
                      }
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
