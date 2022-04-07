// To parse this JSON data, do
//
//     final favorite = favoriteFromJson(jsonString);

import 'dart:convert';

List<Favorite> favoriteFromJson(String str) =>
    List<Favorite>.from(json.decode(str).map((x) => Favorite.fromJson(x)));

String favoriteToJson(List<Favorite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favorite {
  Favorite({
    required this.id,
    required this.userId,
    required this.foodId,
    required this.wineId,
  });

  int id;
  String userId;
  String foodId;
  String wineId;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        userId: json["user_id"],
        foodId: json["food_id"],
        wineId: json["wine_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "food_id": foodId,
        "wine_id": wineId,
      };
}
