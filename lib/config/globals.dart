library pairings.globals;
import '../models/user.dart';


/// Global Variables
/// variables used throughout the application and universally
/// available without having to actively carry forward for every
/// redirection of the application

/// current user information
late User currentUser;

/// login status of the application
bool isLoggedIn = false;

/// change password request until account is updated
late String changePassword;

