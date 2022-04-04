import 'package:pairings/models/user.dart';
import '../config/globals.dart' as globals;

/// signupController used for new user account creation authentication
bool signupController(User newUser) {

    // TODO - update code here
    // ***** STUB OUT FOR CONTROLLER CALL TO CREATION OF NEW ACCOUNT *****
    // RETURN USER OBJECT CORRESPONDING TO WHETHER EMAIL IS AVAILABLE
    // AND NEW ACCOUNT CREATED

    // method to authenticate new user account creation
    bool createAccount(User newUser) {
        // TODO - call db_connector for retrieval of record containing newUser.email match
        // TODO - if null, add new record to database
        // TODO -   set globals.currentUser = record;
        globals.isLoggedIn = true;
        return true;
        // TODO - }
        // return false;
    }

    return createAccount(newUser);
}

