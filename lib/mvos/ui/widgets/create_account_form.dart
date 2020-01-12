import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              TextFormField(
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
              SizedBox(
                height: 24,
              ),
              TextFormField(
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
              SizedBox(
                height: 24,
              ),
              TextFormField(
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
              SizedBox(
                height: 24,
              ),
              TextFormField(
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
              SizedBox(
                height: 24,
              ),
              TextFormField(
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
              SizedBox(
                height: 50,
              ),
              Container(
                width: 180,
                height: 50,
                child: RaisedButton(
                  color: Colors.pink,
                  //this will be block function instead of arrow,
                  // because you will first validate form
                  // before sending the data trough observable.
                  // only if observable future gets resolved,
                  // you will push new route
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteName.homePage),
                  child: Text(
                    'Create account',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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

