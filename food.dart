import 'dart:convert';

/// Food Class
/// class holds a food object for the application
class Food {

  int id;
  String title;
  String image;
  String imageType;


  // full constructor
  Food({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });


  // food object from json
  factory Food.fromJson(Map<String, dynamic> json) =>
      Food(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
      );


  // food object to json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
      };


  // print food object (primarily for debugging purposes)
  @override
  String toString() {
    return 'Food{'
      'id:=$id, '
      'title:=$title, '
    ;
  }
}
