

abstract class CreateAccountO {
  Function createAccount(
      {String name,
      String surname,
      String email,
      String phone,
      String courseCode
      }); // we will change this Function to typedef from model later.
  Function confirmEmailCode({String confirmEmailCode}) {
// for now you just call function with parameters.

// ... other login functions
  }
}
