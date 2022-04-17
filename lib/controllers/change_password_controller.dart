import '../services/db_connector.dart';
import '../config/globals.dart' as globals;


/// Change Password Controller
/// used for changing user password when user actively decides to
/// change and current password is known.  Takes a single verified string
/// as a parameter and returns boolean representing successful update of
/// the user password
Future<bool> changePasswordController(String newPassword) async {

    // temporarily hold current password until new password is updated
    String oldPassword = globals.currentUser.password;
    globals.currentUser.password = newPassword;

    //update account and confirm result
    bool confirm = await DBconnect().updateAccount(globals.currentUser.userToMap(), globals.currentUser.id.toString());
    if(confirm) {
        return true;
    }
    // replace original user password if unsuccessful update
    globals.currentUser.password = oldPassword;
    return false;
}