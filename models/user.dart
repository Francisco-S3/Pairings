
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
}
