import '../services/db_connector.dart';
import '../config/globals.dart' as globals;
import '../models/user.dart';

/// Profile Controller
/// used for updating qn existing user (current) record,
/// including password, if requested. Takes a User object as a parameter and
/// returns boolean indicating whether or not the updates were successful.
Future<bool> profileController(User updateUser) async {

    //update account and confirm result
    bool confirm = await DBconnect().updateAccount(updateUser.userToMap(), updateUser.id.toString());
    if(confirm) {
        // update global variables after successful account creation
        globals.currentUser = updateUser;
        globals.isLoggedIn = true;
        return true;
    }
    // if account with user email already exists or other error incurred
    return false;
}