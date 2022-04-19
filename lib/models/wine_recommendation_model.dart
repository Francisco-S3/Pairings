// To parse this JSON data, do:
//
// final wineRecommendationModel = wineRecommendationModelFromJson(jsonString);
import 'dart:convert';
import 'wine.dart';


// WineRecommendationModel wineRecommendationModelFromJson(String str) =>
//     WineRecommendationModel.fromJson(json.decode(str));
//
// String wineRecommendationModelToJson(WineRecommendationModel data) =>
//     json.encode(data.toJson());


/// Wine Recommendation Class
/// class holds a list of wine objects for the search criteria
class WineRecommendationModel {

  List<Wine>? recommendedWines;
  int? totalFound;


  // full constructor
  WineRecommendationModel({
    this.recommendedWines,
    this.totalFound,
  });


  factory WineRecommendationModel.fromJson(Map<String, dynamic> json) =>
      WineRecommendationModel(
        recommendedWines: List<Wine>.from(
            json["recommendedWines"].map((x) => Wine.fromJson(x))),
        totalFound: json["totalFound"],
      );


  Map<String, dynamic> toJson() => {
        "recommendedWines":
            List<dynamic>.from(recommendedWines!.map((x) => x.toJson())),
        "totalFound": totalFound,
  };


  // print wine recommendation object (primarily for debugging purposes)
  @override
  String toString() {
    return 'Recommendation: totalFound:=$totalFound\n'
      '${recommendedWines.toString()}'
    ;
  }
}