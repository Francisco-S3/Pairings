
class User {
  static const clmnId = 'id';
  static const clmnEmail = 'email';
  var clmnPassword = 'password';
  static const clmnAccountCreated = 'createDate';

  //TODO - modify profile: id, firstname, lastname, birthdate, phone, favorites
  //TODO - remove null field ? from required fields

  // full constructor
  User(
    this.id,
    this.email,
    this.password,
    this.createDate
  );

  // partial Constructor
  User.partial({
    required this.id,
    required this.email,
    required this.password
  }) :
    createDate = DateTime.now()
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
  String? email;
  String? password;
  DateTime? createDate;

  User.fromMap(Map<String, dynamic> map) {
    id = map[clmnId].toInt();
    email = map[clmnEmail];
    password = map[clmnPassword];
    createDate = map[clmnAccountCreated];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      clmnId: id.toString(),
      clmnEmail: email,
      clmnPassword: password,
      clmnAccountCreated: createDate
    };
  }
}
