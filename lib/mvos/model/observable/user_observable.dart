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

class LogOutA {
  final LogOut logOut;

  const LogOutA({@required this.logOut}) : assert(logOut != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogOutA &&
          runtimeType == other.runtimeType &&
          logOut == other.logOut;

  @override
  int get hashCode => logOut.hashCode;
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
  final String email;

  const UserO({
    @required this.user,
    @required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserO &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          email == other.email;

  @override
  int get hashCode => user.hashCode ^ email.hashCode;
}

class IsAdminO {
  final bool isAdmin;

  const IsAdminO({this.isAdmin = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IsAdminO &&
          runtimeType == other.runtimeType &&
          isAdmin == other.isAdmin;

  @override
  int get hashCode => isAdmin.hashCode;
}
