import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CreateAccountForm extends StatefulWidget {

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final formKey = GlobalKey<FormState>();
  String email;
  String name;
  String surname;
  String phone;

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
                height: 24,
              ),
              TextFormField(
                validator: (value) {
                  if (value.length < 3) {
                    return 'Please enter more text';
                  }
                  return null;
                },
                onSaved: (value)  => name = value,
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
                validator: (value) {
                  if (value.length < 3) {
                    return 'Please enter more text';
                  }
                  return null;
                },
                onSaved: (value)  => surname = value,
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
                validator: (val) => !EmailValidator.validate(val, true)
                    ? 'Not a valid email.'
                    : null,
                onSaved: (val) => email = val,
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
                validator: (value) {
                  var potentialNumber = int.tryParse(value);
                  if (potentialNumber == null) {
                    return 'Enter a phone number';
                  }
                },
                onSaved: (value)  => phone = value,
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
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      print(name);
                      print(surname);
                      print(email);
                      print(phone);
                    }
                  },

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
