import 'dart:convert';
import 'food.dart';

/// Recipe Result Class
/// class holds a food result object for the application
class RecipeResult {

  int offset;       // number of results to skip
  int number;       // number of expected results
  List<Food> results;
  int totalResults;


  // full constructor
  RecipeResult({
    required this.offset,
    required this.number,
    required this.results,
    required this.totalResults
  });


  // food object from json
  factory RecipeResult.fromJson(Map<String, dynamic> json) =>
      RecipeResult(
        offset: json["offset"].toInt(),
        number: json["number"].toInt(),
        results: List<Food>.from(json["results"].map((x) => Food.fromJson(x))),
        totalResults: json["totalResults"].toInt(),
  );


  // food object to json
  Map<String, dynamic> toJson() => {
        "offset": offset,
        "number": number,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "totalResults": totalResults,
      };


  // print food object (primarily for debugging purposes)
  @override
  String toString() {
    return 'RecipeResult{'
      'offset:=$offset, '
      'number:=$number, '
      'results:=$results'
      '}\n'
    ;
  }
}
