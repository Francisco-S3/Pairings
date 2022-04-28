// To parse this JSON data, do
//
//     final favorite = favoriteFromJson(jsonString);

import 'dart:convert';

List<Favorite> favoriteFromJson(String str) =>
    List<Favorite>.from(json.decode(str).map((x) => Favorite.fromJson(x)));

String favoriteToJson(List<Favorite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Map<String, String> jsonToMap(String jsonString) =>
    Map.castFrom(json.decode(jsonString));

Map<String, String> favoriteListToMap(Favorite favorite) {
  Map<String, String>? newMap = favorite as Map<String, String>;
  return newMap;
}

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

  Map<String, String> favoriteToMap() => {
        'id': id.toString(),
        'user_id': userId,
        'food_id': foodId,
        'wine_id': wineId,
      };

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "food_id": foodId,
        "wine_id": wineId,
      };

  @override
  String toString() {
    return 'favorite{'
        "id:=$id, "
        'user_id:=$userId, '
        'food_id:=$foodId, '
        'wine_id:=$wineId, ';
  }
}
