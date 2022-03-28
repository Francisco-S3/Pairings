import 'package:pairings/models/user.dart';


// utility to call signinController for user authentication
User signinController(String email, String password) {

    // TODO - update code here
    // ***** STUB OUT FOR CONTROLLER CALL TO AUTHENTICATION *****
    // RETURN USER OBJECT CORRESPONDING TO WHETHER
    // EMAIL/PASSWORD COMBO IS VALID

    // TODO - use id range from -1 to 99 for error responses only
    // TODO - start valid id number at 101

    // TODO - test case (don't forget to delete)
    // if id > 1000, instantiate user object and return
    // else return error user object

    return User(
        id: 102,
        email: email,
        password: password,
    );
}