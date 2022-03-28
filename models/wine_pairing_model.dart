// To parse this JSON data, do
<<<<<<< HEAD
// final winePairingModel = winePairingModelFromJson(jsonString);

import 'dart:convert';


=======
//
//     final winePairingModel = winePairingModelFromJson(jsonString);

import 'dart:convert';

>>>>>>> main
WinePairingModel winePairingModelFromJson(String str) =>
    WinePairingModel.fromJson(json.decode(str));

String winePairingModelToJson(WinePairingModel data) =>
    json.encode(data.toJson());

class WinePairingModel {
  WinePairingModel({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  List<String>? pairedWines;
  String? pairingText;
  List<ProductMatch>? productMatches;

  factory WinePairingModel.fromJson(Map<String, dynamic> json) =>
      WinePairingModel(
        pairedWines: List<String>.from(json["pairedWines"].map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: List<ProductMatch>.from(
            json["productMatches"].map((x) => ProductMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pairedWines": List<dynamic>.from(pairedWines!.map((x) => x)),
        "pairingText": pairingText,
        "productMatches":
            List<dynamic>.from(productMatches!.map((x) => x.toJson())),
      };
}

class ProductMatch {
  ProductMatch({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link,
  });

  int? id;
  String? title;
  String? description;
  String? price;
  String? imageUrl;
  double? averageRating;
  int? ratingCount;
  double? score;
  String? link;

  factory ProductMatch.fromJson(Map<String, dynamic> json) => ProductMatch(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        averageRating: json["averageRating"].toDouble(),
        ratingCount: json["ratingCount"].toInt(),
        score: json["score"].toDouble(),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "averageRating": averageRating,
        "ratingCount": ratingCount,
        "score": score,
        "link": link,
      };
}
