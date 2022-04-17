import '../services/db_connector.dart';
import '../config/globals.dart' as globals;
import '../models/user.dart';


/// Sign Up Controller
/// used for new user account creation authentication. takes user
/// object as a parameter and returns boolean indicating whether or
/// not the new account was successfully created
Future<bool> signupController(User newUser) async {

    //create account and confirm result
    bool confirm = await DBconnect().createAccount(newUser.userToMap());
    if(confirm) {
        // update global variables after successful account creation
        globals.currentUser = newUser;
        globals.isLoggedIn = true;
        return true;
    }
    // if account with user email already exists or other error incurred
    return false;
}

