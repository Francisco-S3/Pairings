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
    if (confirm != null) {
        print(confirm.toString());
        globals.isLoggedIn = true;
        return true;
    }
    return false;
}
    // method to authenticate existing user login
    //bool authenticate(String email, String password) {
        // TODO - call db_connector for retrieval of record containing email match
        // TODO - if no record match, return false;
        // TODO - compare record match password vs. parameter password
        // TODO - if(user.email exists && user.password == password) {
        // TODO -   set globals.currentUser = record;

        // TODO - }
        // TODO - return false;
    //}
