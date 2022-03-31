// To parse this JSON data, do
// final foodSearchModel = foodSearchModelFromJson(jsonString);

import 'dart:convert';


FoodSearchModel foodSearchModelFromJson(String str) =>
    FoodSearchModel.fromJson(json.decode(str));

String foodSearchModelToJson(FoodSearchModel data) =>
    json.encode(data.toJson());

class FoodSearchModel {
  FoodSearchModel({
    this.sorting,
    this.filterMapping,
    this.filterOptions,
    this.activeFilterOptions,
    this.query,
    this.totalResults,
    this.limit,
    this.offset,
    this.searchResults,
    this.expires,
  });

  String? sorting;
  FilterMapping? filterMapping;
  List<dynamic>? filterOptions;
  List<dynamic>? activeFilterOptions;
  String? query;
  int? totalResults;
  int? limit;
  int? offset;
  List<FoodSearchResult>? searchResults;
  int? expires;

  factory FoodSearchModel.fromJson(Map<String, dynamic> json) =>
      FoodSearchModel(
        sorting: json["sorting"],
        filterMapping: FilterMapping.fromJson(json["filterMapping"]),
        filterOptions: List<dynamic>.from(json["filterOptions"].map((x) => x)),
        activeFilterOptions:
            List<dynamic>.from(json["activeFilterOptions"].map((x) => x)),
        query: json["query"],
        totalResults: json["totalResults"],
        limit: json["limit"],
        offset: json["offset"],
        searchResults: List<FoodSearchResult>.from(
            json["searchResults"].map((x) => FoodSearchResult.fromJson(x))),
        expires: json["expires"],
      );

  Map<String, dynamic> toJson() => {
        "sorting": sorting,
        "filterMapping": filterMapping?.toJson(),
        "filterOptions": List<dynamic>.from(filterOptions!.map((x) => x)),
        "activeFilterOptions":
            List<dynamic>.from(activeFilterOptions!.map((x) => x)),
        "query": query,
        "totalResults": totalResults,
        "limit": limit,
        "offset": offset,
        "searchResults":
            List<dynamic>.from(searchResults!.map((x) => x.toJson())),
        "expires": expires,
      };
}

class FilterMapping {
  FilterMapping();

  factory FilterMapping.fromJson(Map<String, dynamic> json) => FilterMapping();

  Map<String, dynamic> toJson() => {};
}

class FoodSearchResult {
  FoodSearchResult({
    this.name,
    this.type,
    this.totalResults,
    this.totalResultsVariants,
    this.results,
  });

  String? name;
  String? type;
  int? totalResults;
  int? totalResultsVariants;
  List<FoodResult>? results;

  factory FoodSearchResult.fromJson(Map<String, dynamic> json) =>
      FoodSearchResult(
        name: json["name"],
        type: json["type"],
        totalResults: json["totalResults"],
        totalResultsVariants: json["totalResultsVariants"] == null
            ? null
            : json["totalResultsVariants"],
        results: List<FoodResult>.from(
            json["results"].map((x) => FoodResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "totalResults": totalResults,
        "totalResultsVariants":
            totalResultsVariants == null ? null : totalResultsVariants,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class FoodResult {
  FoodResult({
    this.id,
    this.name,
    this.image,
    this.link,
    this.type,
    this.relevance,
    this.content,
    this.dataPoints,
    this.images,
  });

  int? id;
  String? name;
  String? image;
  String? link;
  Type? type;
  double? relevance;
  String? content;
  List<dynamic>? dataPoints;
  List<dynamic>? images;

  factory FoodResult.fromJson(Map<String, dynamic> json) => FoodResult(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        image: json["image"],
        link: json["link"] == null ? null : json["link"],
        type: typeValues.map[json["type"]],
        relevance: json["relevance"].toDouble(),
        content: json["content"] == null ? null : json["content"],
        dataPoints: json["dataPoints"] == null
            ? null
            : List<dynamic>.from(json["dataPoints"].map((x) => x)),
        images: json["images"] == null
            ? null
            : List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
        "image": image,
        "link": link == null ? null : link,
        "type": typeValues.reverse[type],
        "relevance": relevance,
        "content": content == null ? null : content,
        "dataPoints": dataPoints == null
            ? null
            : List<dynamic>.from(dataPoints!.map((x) => x)),
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
      };
}

enum Type { HTML, YOUTUBE_VIDEO }

final typeValues =
    EnumValues({"HTML": Type.HTML, "YOUTUBE_VIDEO": Type.YOUTUBE_VIDEO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
