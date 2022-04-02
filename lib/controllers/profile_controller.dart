import 'package:flutter/material.dart';
import '../config/globals.dart' as globals;
import '../models/user.dart';

/// profileController used for updating user record, including password
bool profileController(User newUser) {

    //TODO - update code here
    // ***** STUB OUT FOR CONTROLLER CALL TO UPDATE PROFILE DATA *****
    // RETURN BOOLEAN VALUE CORRESPONDING TO UPDATE HAS OCCURRED

    // method to update current user account information
    bool updateAccount(User newUser) {
        // TODO - call db_connector for retrieval of record containing newUser.email match
        // TODO - if null, error handling since account should exist
        // TODO -   update database record = newUser;
        // TODO -   updateglobals.currentUser = record;
        return true;
        // TODO - }
        // return false;
    }

    return updateAccount(newUser);
}