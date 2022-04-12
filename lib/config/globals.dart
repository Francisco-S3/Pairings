library pairings.globals;
import '../models/user.dart';


/// global variable that holds current user information
late User currentUser;

/// global variable that hold the login status of the application
bool isLoggedIn = false;

/// global variable that holds change password request until account is updated
late String changePassword;

