

abstract class LoginO {
  Function login({String email});

}
  class LoginErrorO {
  final String error;

  LoginErrorO(this.error);
  }

  class CreateAccountErrorO {
  final String error;

  CreateAccountErrorO(this.error);
  }
