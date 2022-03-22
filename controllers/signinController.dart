import 'dart:convert';
import 'dart:io';
import 'package:pairings/models/user.dart';

// utility to call signinController for user authentication
User signinController(String email, String password) {

    // ***** STUB OUT FOR CONTROLLER CALL TO AUTHENTICATION *****
    // RETURN USER OBJECT CORRESPONDING TO WHETHER
    // EMAIL/PASSWORD COMBO IS VALID

    //TODO use id range from -1 to 999 for error responses only
    //TODO start id number at 1001

    // test case
    // if id > 1000, instantiate user object and return
    // else return error user object

    return User.partial(
        id: 1001,
        email: 'rsking2@uncg.edu',
        password: 'password',
    );
}