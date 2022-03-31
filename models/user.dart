import 'dart:convert';
import '../config/globals.dart' as globals;
import 'db_connector.dart';
import 'package:shared_preferences/shared_preferences.dart';


List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

Map<dynamic, dynamic> jsonToMap(List jList) {
  Map newMap = jList[0];
  return newMap;
}

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// User class holds a user object for the application
class User {

// full constructor
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNum,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
  });

  // partial constructor
  User.partial({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNum,
    required this.birthDate,
  }) :
        id = -1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now()
  ;

  //getter function for password retrieval
  String? get getPassword {
    return password;
  }

  @override
  // printout object for debugging purposes
  String toString() {
    return "user{"
        "id:= $id, "
        "email:= $email, "
        "password:= $password, "
        "firstName:= $firstName, "
        "lastName:= $lastName, "
        "phoneNum:= $phoneNum, "
        "birthDate:= $birthDate, "
        "createdAt:= $createdAt, "
        "updatedAt:= $updatedAt}"
    ;
  }

  // method to authenticate existing user login
  static bool authenticate(String email, String password) {
    // TODO - call db_connector for retrieval of record containing email match
    // TODO - if no record match, return false;
    // TODO - compare record match password vs. parameter password
    // TODO - if(record.password == password) {
    // TODO -   set globals.currentUser = record;
    globals.isLoggedIn = true;
    return true;
    // TODO - }
    // TODO - return false;
  }

  // method to authenticate new user account creation
  static bool createAccount(User newUser) {
    // TODO - call db_connector for retrieval of record containing newUser.email match
    // TODO - if null, add new record to database
    // TODO -   set globals.currentUser = record;
    globals.isLoggedIn = true;
    return true;
    // TODO - }
    // return false;
  }

  int id;
  String email;
  String password;
  String firstName;
  String lastName;
  String phoneNum;
  DateTime birthDate;
  DateTime createdAt;
  DateTime updatedAt;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"].toInt(),
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNum: json["phoneNum"],
    birthDate: DateTime.parse(json["birthDate"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNum": phoneNum,
    "birthDate":
      "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };


  factory User.fromMap(Map<String, dynamic> map) => User(
    id: map["id"].toInt(),
    email: map["email"],
    password: map["password"],
    firstName: map["firstName"],
    lastName: map["lastName"],
    phoneNum: map["phoneNum"],
    birthDate: DateTime.parse(map["birthDate"]),
    createdAt: DateTime.parse(map["created_at"]),
    updatedAt: DateTime.parse(map["updated_at"]),
  );
}
