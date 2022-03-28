import '../models/user.dart';

// utility to call signupController for creating new user account
User signupController(String email, String password) {
  // TODO - update code here
  // ***** STUB OUT FOR CONTROLLER CALL TO CREATION OF NEW ACCOUNT *****
  // RETURN USER OBJECT CORRESPONDING TO WHETHER EMAIL IS AVAILABLE
  // AND NEW ACCOUNT CREATED

  // TODO - use id range from -1 to 999 for error responses only
  // TODO - start valid id number at 1001

  // TODO - test case (don't forget to delete)
  // if id > 1000, instantiate user object and return
  // else return error user object

  return User(
    id: 102,
    email: 'rsking2@uncg.edu',
    password: 'password',
  );
}
