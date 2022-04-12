import 'package:flutter/material.dart';
import '../services/db_connector.dart';
import '../models/user.dart';
import '../config/globals.dart' as globals;

/// signinController used for user login authentication for existing
/// accounts.  Takes two Strings as parameters and returns boolean indicating whether
/// or not the login was successful.
Future<bool> signinController(String email, String password) async {

    // attempt to login with credentials provided
    List<User>? confirm = await DBconnect().authenticate(email, password);

    // if match, then assign to current user and return true
    if (confirm != null) {
        print(confirm.toString());
        globals.currentUser = confirm[0];
        globals.isLoggedIn = true;
        return true;
    }
    return false;
}
