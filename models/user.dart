<<<<<<< HEAD
=======
//     final user = userFromJson(jsonString);

import 'dart:convert';
>>>>>>> main

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

<<<<<<< HEAD
class User {
  static const clmnId = 'id';
  static const clmnEmail = 'email';
  var clmnPassword = 'password';
  static const clmnAccountCreated = 'createDate';
  var clmnFName = 'firstName';
  var clmnLName = 'lastName';
  var clmnPhoneNum = 'phoneNum';
  static const clmnBirthDate = 'birthDate';


  // constructor
  User({
    required this.id,
    required this.email,
    required this.password,
    this.firstName = '',
    this.lastName = '',
    this.phoneNum = '',
    birthDate = ''
  }) :
    createDate = DateTime.now().toString()
  ;

  //setter function for password change
  set setPassword(String value) {
    password = value;
  }
  //getter function for password retrieval
  String? get getPassword {
    return password;
  }

  @override
  String toString() {
    return "user{"
      "id:= $id, "
      "email:= $email, "
      "password:= $password, "
      "createDate:= $createDate, "
      "firstName:= $firstName, "
      "lastName:= $lastName, "
      "phoneNum:= $phoneNum, "
      "birthDate:= $birthDate}"
    ;
  }

  int? id;
  String? email;
  String? password;
  String? createDate;
  String? firstName;
  String? lastName;
  String? phoneNum;
  String? birthDate;


  User.fromMap(Map<String, dynamic> map) {
    id = map[clmnId].toInt();
    email = map[clmnEmail];
    password = map[clmnPassword];
    createDate = map[clmnAccountCreated];
    firstName = map[clmnFName];
    lastName = map[clmnLName];
    phoneNum = map[clmnPhoneNum];
    birthDate = map[clmnBirthDate];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      clmnId: id.toString(),
      clmnEmail: email,
      clmnPassword: password,
      clmnAccountCreated: createDate,
      clmnFName: firstName,
      clmnLName: lastName,
      clmnPhoneNum: phoneNum,
      clmnBirthDate: birthDate
    };
  }
=======
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.phoneNum,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  DateTime birthDate;
  String phoneNum;
  String email;
  String password;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthDate: DateTime.parse(json["birthDate"]),
        phoneNum: json["phoneNum"],
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birthDate":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "phoneNum": phoneNum,
        "email": email,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
>>>>>>> main
}
