import 'package:pairings/models/profile.dart';

// User Class
//
//


class User {

  //static User _currentUser;

  final String userID;  //email address
  String password;
  late Profile profile;
  bool isLoggedIn;

  // Constructor
  User({
    required this.userID,
    required this.password,
  }) :
  isLoggedIn = true;

  //_currentUser = this;
}