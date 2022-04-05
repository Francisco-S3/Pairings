//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// User class holds a user object for the application
class User {
  var id;

  /// full constructor
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

  /// partial constructor
  User.partial({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNum,
    required this.birthDate,
  })  : id = -1,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

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
}
