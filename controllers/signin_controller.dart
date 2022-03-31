import 'package:flutter/material.dart';
import '../models/user.dart';

/// signinController used for user login authentication
bool signinController(String email, String password) {

    // TODO - update code here
    // ***** STUB OUT FOR CONTROLLER CALL TO AUTHENTICATION *****
    // RETURN BOOLEAN VALUE CORRESPONDING TO WHETHER
    // EMAIL/PASSWORD COMBO IS VALID

    return User.authenticate(email, password);
}
