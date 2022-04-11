//     final user = userFromJson(jsonString);
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../services/db_connector.dart';
import 'package:flutter/cupertino.dart';
import '../config/globals.dart' as globals;


// helper conversion functions

// json to user
List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// user to json
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// json to map conversion
Map<String, String> jsonToMap(String jsonString) =>
  Map.castFrom(json.decode(jsonString));

// user to map conversion
Map<String, String> userListToMap(User user) {
  Map<String, String>? newMap = user as Map<String, String>;
  return newMap;
}

// json to map conversion
// Map <String, String> jsonToMap2(String json) {
//   return data.map<User> (User.fromJson).toList();
// }

/// User class holds a user object for the application
class User {

/// full constructor
  User({
    //required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNum,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
  });

  /// partial constructor
  User.partial({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNum,
    required this.birthDate,
  }) :
        //id = -1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now()
  ;

  //int id;
  String email;
  String password;
  String firstName;
  String lastName;
  String phoneNum;
  DateTime birthDate;
  DateTime createdAt;
  DateTime updatedAt;


  factory User.fromJson(Map<String, dynamic> json) => User(
    //id: json["id"].toInt(),
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNum: json["phoneNum"],
    birthDate: DateTime.parse(json["birthDate"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, String> userToMap() => {
    //'id': id.toString(),
    'email': email,
    'password': password,
    'firstName': firstName,
    'lastName': lastName,
    'phoneNum': phoneNum,
    'birthDate':
    '${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}',
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  Map<String, String> toJson() => {
    //'id': id.toString(),
    'email': email,
    'password': password,
    'firstName': firstName,
    'lastName': lastName,
    'phoneNum': phoneNum,
    'birthDate':
    '${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}',
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  // //@override
  // verifyUser() async {
  //   Future<User> loadByEmail(String email) async {
  //     User newUser = await DBconnect().read(email) as User;
  //     return newUser;
  //   }
  //
  //   // List<User>? checkEmail = await DBconnect.read(email);
  //   // User checkPassword = (await)
  //   if (newUser == null) {
  //     return null;
  //   } else if (password != this.password) {
  //     return null;
  //   } else {
  //     // ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
  //     // final ParseResponse? parseResponse =
  //     //     await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);
  //     savePref(String email, String password) async {
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       preferences.setString("email", email);
  //       preferences.setString("password", password);
  //     }
  //   }
  // }
  //
  // //@Override
  // register() async {
  //   print('step1');
  //   //reading the email to check if the email already exists
  //   Future<User> loadByEmail(String email) async {
  //     print('step2');
  //     User newUser = await DBconnect().read(email) as User;
  //     print('step3');
  //     return newUser;
  //   }
  //
  //   if (newUser == null) {
  //     print('step4');
  //     Map<String, String> register(String email, String firstName,
  //         String lastName, String birthDate, String phoneNum, String password) {
  //       final Map<String, String> register = {
  //         email = 'email',
  //         firstName = 'firstName',
  //         lastName = 'lastName',
  //         birthDate = 'birthDate',
  //         phoneNum = 'phoneNum',
  //         password = 'password'
  //       } as Map<String, String>;
  //       User newUser = DBconnect().create(register) as User;
  //       print('made it this far');
  //       return register;
  //     }
  //
  //     savePrefRegistration(
  //         int id,
  //         String email,
  //         String firstName,
  //         String lastName,
  //         String birthDate,
  //         String phoneNum,
  //         String password,
  //         String createdAt,
  //         String updatedAT) async {
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       preferences.setInt("id", id);
  //       preferences.setString("email", email);
  //       preferences.setString("firstName", firstName);
  //       preferences.setString("lastName", lastName);
  //       preferences.setString("birthDate", birthDate);
  //       preferences.setString("phoneNum", phoneNum);
  //       preferences.setString("password", password);
  //       preferences.setString("createdAt", createdAt);
  //       preferences.setString("updatedAt", updatedAT);
  //     }
  //   } else {
  //     print('made it to the else end');
  //     return null;
  //   }
  // }
  //
  // update() async {
  //   Future<User> updateUser(String email) async {
  //     User updatedUser = await DBconnect().update(Map(), id) as User;
  //     return updatedUser;
  //   }
  // }
  //
  // delete() async {
  //   Future<User> deleteUser(String email) async {
  //     User deletedUser = await DBconnect().delete(email) as User;
  //     return deletedUser;
  //   }
  // }

  // factory User.fromMap(Map<String, dynamic> map) => User(
  //   id: map["id"].toInt(),
  //   email: map["email"],
  //   password: map["password"],
  //   firstName: map["firstName"],
  //   lastName: map["lastName"],
  //   phoneNum: map["phoneNum"],
  //   birthDate: DateTime.parse(map["birthDate"]),
  //   createdAt: DateTime.parse(map["created_at"]),
  //   updatedAt: DateTime.parse(map["updated_at"]),
  // );


  @override
  // printout object for debugging purposes
  String toString() {
    return 'user{'
        //"id:=$id, "
        'email:=$email, '
        'password:=$password, '
        'firstName:=$firstName, '
        'lastName:=$lastName, '
        'phoneNum:=$phoneNum, '
        'birthDate:=$birthDate, '
        'createdAt:=$createdAt, '
        'updatedAt:=$updatedAt}'
    ;
  }
}
