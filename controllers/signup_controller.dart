import 'package:pairings/models/user.dart';
import '../config/globals.dart' as globals;

/// signupController used for new user account creation authentication
bool signupController(User newUser) {

    // TODO - update code here
    // ***** STUB OUT FOR CONTROLLER CALL TO CREATION OF NEW ACCOUNT *****
    // RETURN USER OBJECT CORRESPONDING TO WHETHER EMAIL IS AVAILABLE
    // AND NEW ACCOUNT CREATED

    return User.createAccount(newUser);
}