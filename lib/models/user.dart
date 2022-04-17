import 'dart:convert';


/// User Class
/// class holds a user object for the application


/// helper conversion functions
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


class User {

  int? id;            // generated by database
  String email;
  String password;
  String firstName;
  String lastName;
  String phoneNum;
  DateTime birthDate;
  DateTime createdAt; // generated by database
  DateTime updatedAt; // generated by database


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
  }) :
        id = 0,                     // default value updated by database
        createdAt = DateTime.now(), // default value updated by database
        updatedAt = DateTime.now()  // default value updated by database
  ;

  // user object created from json
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


  // map created from user object
  Map<String, String> userToMap() => {
    'id': id.toString(),
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


  // map created from user object
  Map<String, String> toJson() => {
    'id': id.toString(),
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


  // print user object (primarily for debugging purposes)
  @override
  String toString() {
    return 'user{'
        "id:=$id, "
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
