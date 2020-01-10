import 'package:flutter/material.dart';
import 'package:playground_app/router/router.dart';


class CAForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 24,),
              TextFormField(
                decoration: InputDecoration(icon: Icon(Icons.person),
                  labelText: 'Ime',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Prezime',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
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
              SizedBox(height: 24,),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'Telefon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
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
              RaisedButton(
                color: Colors.pink,
                onPressed: ()=> Navigator.pushNamed(context, RouteName.homePage),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



