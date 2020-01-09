import 'package:flutter/foundation.dart';
import 'package:playground_app/mvos/model/user_model.dart';

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

class LoginO {
  final LoginA login;
  final ConfirmEmailCodeA confirmEmailCode;

  const LoginO({@required this.login, @required this.confirmEmailCode})
      : assert(login != null),
        assert(confirmEmailCode != null);

  @override
  bool operator ==(Object other) =>
      identical(
          this, other) ||
          other is LoginO &&
              runtimeType == other.runtimeType &&
              login == other.login &&
              confirmEmailCode == other.confirmEmailCode;

  @override
  int get hashCode =>
      login.hashCode ^
      confirmEmailCode.hashCode;
  


}
