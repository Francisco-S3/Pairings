// To parse this JSON data, do
// final wineRecommendationModel = wineRecommendationModelFromJson(jsonString);


import 'dart:convert';

WineRecommendationModel wineRecommendationModelFromJson(String str) =>
    WineRecommendationModel.fromJson(json.decode(str));

String wineRecommendationModelToJson(WineRecommendationModel data) =>
    json.encode(data.toJson());

class WineRecommendationModel {
  WineRecommendationModel({
    this.recommendedWines,
    this.totalFound,
  });

  List<RecommendedWine>? recommendedWines;
  int? totalFound;

  factory WineRecommendationModel.fromJson(Map<String, dynamic> json) =>
      WineRecommendationModel(
        recommendedWines: List<RecommendedWine>.from(
            json["recommendedWines"].map((x) => RecommendedWine.fromJson(x))),
        totalFound: json["totalFound"],
      );

  Map<String, dynamic> toJson() => {
        "recommendedWines":
            List<dynamic>.from(recommendedWines!.map((x) => x.toJson())),
        "totalFound": totalFound,
      };
}

class RecommendedWine {
  RecommendedWine({
    this.id,
    this.title,
    this.averageRating,
    this.description,
    this.imageUrl,
    this.link,
    this.price,
    this.ratingCount,
    this.score,
  });

  int? id;
  String? title;
  double? averageRating;
  String? description;
  String? imageUrl;
  String? link;
  String? price;
  int? ratingCount;
  double? score;

  factory RecommendedWine.fromJson(Map<String, dynamic> json) =>
      RecommendedWine(
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
}
