import 'package:flutter/foundation.dart';

class UserE {
  final String uid;

  const UserE({
    @required this.uid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserE && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;

  @override
  String toString() {
    return 'UserE{uid: $uid}';
  }
}
