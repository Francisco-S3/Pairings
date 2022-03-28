import 'wine.dart';

class Profile {
  static const clmnId = 'id';
  static const clmnAccountCreated = 'createDate';
  //late List <Wine> clmnFavorites = 'favorites';

  //TODO add image?
  //TODO - modify user: id, email, password, createdate
  //TODO - modify profile: id, firstname, lastname, birthdate, phone, favorites

  // full constructor
  Profile({this.id, this.createDate, this.favorites});

  // partial constructor
  Profile.partial({this.id, this.createDate});

  int? id;
  String? createDate;
  List? favorites;

  factory Profile.fromJson(Map<String, dynamic> parsedJson) {
    return Profile(
        id: parsedJson['clmnId'],
        createDate: parsedJson['clmnAccountCreated'],
        favorites: parsedJson['clmnFavorites']);
  }
}
