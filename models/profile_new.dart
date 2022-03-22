import 'package:pairings/models/wine.dart';
import 'package:pairings/models/user.dart';


class Profile {
  static const clmnId = 'id';
  var clmnFName = 'firstName';
  var clmnLName = 'lastName';
  static const clmnBirthDate = 'birthDate';
  var clmnPhoneNum = 'phoneNum';
  //late List <Wine> clmnFavorites = 'favorites';

  // full constructor
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.phoneNum,
    //this.favorites
  });

  // partial constructor
  Profile.partial({
    this.id
    }) :
    firstName = '',
    lastName = ''
  ;

  int? id;
  String? firstName;
  String? lastName;
  String? phoneNum;
  String? birthDate;
  //List?<Wine> favorites;

  factory Profile.fromJson(Map<String, dynamic> parsedJson){
    return Profile(
        id: parsedJson['clmnId'],
        firstName: parsedJson['clmnFName'],
        lastName: parsedJson['clmnLName'],
        birthDate: parsedJson['clmnBirthDate'],
        phoneNum: parsedJson['clmnPhoneNum'],
        //favorites: parsedJson ['clmnFavorites']
    );
  }
}
