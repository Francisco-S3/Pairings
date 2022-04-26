import 'dart:convert';

/// Wine Class
/// class holds a wine object for the application
class Wine {

  int id;
  String? title;
  double averageRating;
  String description;
  String imageUrl;
  String link;
  String price;
  int ratingCount;
  double score;


  // full constructor
  Wine({
    required this.id,
    required this.title,
    required this.averageRating,
    required this.description,
    required this.imageUrl,
    required this.link,
    required this.price,
    required this.ratingCount,
    required this.score,
  });

  // partial constructor
  Wine.partial({
    required this.id,
    required this.title,
    required this.averageRating,
  }) :
        description = 'tbd',
        imageUrl = 'tbd',
        link = 'tbd',
        price = '0.00',
        ratingCount = 0,
        score = 0.00
  ;


  // wine object from json
  factory Wine.fromJson(Map<String, dynamic> json) =>
      Wine(
        id: json["id"],
        title: json["title"],
        averageRating: json["averageRating"].toDouble(),
        description: json["description"],
        imageUrl: json["imageUrl"],
        link: json["link"],
        price: json["price"],
        ratingCount: json["ratingCount"].toInt(),
        score: json["score"].toDouble(),
      );


  // wine object to json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "averageRating": averageRating,
        "description": description,
        "imageUrl": imageUrl,
        "link": link,
        "price": price,
        "ratingCount": ratingCount,
        "score": score,
  };


  // print wine object (primarily for debugging purposes)
  @override
  String toString() {
    return 'Wine{'
      'id:=$id, '
      'title:=$title, '
      'price:=$price, '
      'rating:=$averageRating, '
      'score:=$score}\n'
    ;
  }
}
