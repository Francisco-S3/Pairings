
class User {
  //static const tableUser = 'User';
  static const clmnId = 'id';
  var clmnFName = 'firstName';
  var clmnLName = 'lastName';
  static const clmnBirthDate = 'birthDate';
  var clmnPhoneNum = 'phoneNum';
  static const clmnEmail = 'email';
  var clmnPassword = 'password';

  //TODO - modify user: id, email, password, createdate
  //TODO - modify profile: id, firstname, lastname, birthdate, phone, favorites
  //TODO - remove null field ? from required fields

  // full constructor
  User(
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.phoneNum,
  );

  // partial Constructor
  User.partial({
    required this.id,
    required this.email,
    required this.password
  }) :
    // default values for non-required fields
    firstName = "",
    lastName = "",
    birthDate = DateTime.now(),
    phoneNum = ""
  ;

  //setter function for password change
  set setPassword(String value) {
    password = value;
  }
  //getter function for password retrieval
  String? get getPassword {
    return password;
  }

  int? id;
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  String? phoneNum;
  String? email;
  String? password;

  User.fromMap(Map<String, dynamic> map) {
    id = map[clmnId].toInt();
    firstName = map[clmnFName];
    lastName = map[clmnLName];
    birthDate = map[clmnBirthDate];
    phoneNum = map[clmnPhoneNum];
    email = map[clmnEmail];
    password = map[clmnPassword];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      clmnId: id.toString(),
      clmnFName: firstName,
      clmnLName: lastName,
      clmnBirthDate: birthDate,
      clmnPhoneNum: phoneNum,
      clmnEmail: email,
      clmnPassword: password
    };
  }
}
