import 'package:flutter/foundation.dart';

class FirebaseUserE {
  final String uid;
  final String email;

  const FirebaseUserE({@required this.uid, @required this.email});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirebaseUserE &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email;

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;
}
