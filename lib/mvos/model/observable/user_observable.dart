import 'package:flutter/foundation.dart';

class LoggedInO {
  final bool loggedIn;

  const LoggedInO({
    @required this.loggedIn,
  }) : assert(loggedIn != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedInO &&
          runtimeType == other.runtimeType &&
          loggedIn == other.loggedIn;

  @override
  int get hashCode => loggedIn.hashCode;
}
