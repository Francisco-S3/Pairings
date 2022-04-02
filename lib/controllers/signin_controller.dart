import 'package:flutter/material.dart';
import '../models/user.dart';
import '../config/globals.dart' as globals;

/// signinController used for user login authentication
bool signinController(String email, String password) {

    // TODO - update code here
    // ***** STUB OUT FOR CONTROLLER CALL TO AUTHENTICATION *****
    // RETURN BOOLEAN VALUE CORRESPONDING TO WHETHER
    // EMAIL/PASSWORD COMBO IS VALID


    // TODO - *********** IMPORTANT ********************
    // TODO - remove this code once signin process is operational
    globals.currentUser = User.partial(
        email: 'test@test.com',
        password: 'password',
        firstName: 'testName',
        lastName: 'lastName',
        phoneNum: '336-555-1212',
        birthDate: DateTime(2000),
    );


    // method to authenticate existing user login
    bool authenticate(String email, String password) {
        // TODO - call db_connector for retrieval of record containing email match
        // TODO - if no record match, return false;
        // TODO - compare record match password vs. parameter password
        // TODO - if(user.email exists && user.password == password) {
        // TODO -   set globals.currentUser = record;
        globals.isLoggedIn = true;
        return true;
        // TODO - }
        // TODO - return false;
    }
    return authenticate(email, password);
}
