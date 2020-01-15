import 'package:flutter/foundation.dart';

class FirebaseUserE {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String phone;
  final String uid;
  final List courseCode;


  const FirebaseUserE({ @required this.name,@required  this.surname,@required  this.password,@required  this.phone,
  @required  this.courseCode, @required this.uid, @required this.email});

  @override
  bool operator ==(Object other) =>
      identical(
          this, other) ||
          other is FirebaseUserE &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              surname == other.surname &&
              email == other.email &&
              password == other.password &&
              phone == other.phone &&
              uid == other.uid &&
              courseCode == other.courseCode;

  @override
  int get hashCode =>
      name.hashCode ^
      surname.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phone.hashCode ^
      uid.hashCode ^
      courseCode.hashCode;
});




}
