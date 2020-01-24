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

class LoginA {
  final Login login;

  const LoginA({@required this.login}) : assert(login != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginA &&
          runtimeType == other.runtimeType &&
          login == other.login;

  @override
  int get hashCode => login.hashCode;
}

class CreateAccountA {
  final CreateAccount createAccount;

  const CreateAccountA({
    @required this.createAccount,
  }) : assert(createAccount != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAccountA &&
          runtimeType == other.runtimeType &&
          createAccount == other.createAccount;

  @override
  int get hashCode => createAccount.hashCode;
}

class UserO {
  final String user;
  const UserO({@required this.user}) : assert(user != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserO && runtimeType == other.runtimeType && user == other.user;

  @override
  int get hashCode => user.hashCode;
}
