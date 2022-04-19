// To parse this JSON data, do:
//
// final winePairingModel = winePairingModelFromJson(jsonString);
import 'dart:convert';
import 'package:pairings/models/wine.dart';


/// helper conversion functions
// wine pairing model from json
WinePairingModel winePairingModelFromJson(String str) =>
    WinePairingModel.fromJson(json.decode(str));

// wine pairing model to json
String winePairingModelToJson(WinePairingModel data) =>
    json.encode(data.toJson());


/// Wine Pairing Class
/// class holds a pairings object for the application
class WinePairingModel {

  List<String>? pairedWines;
  String? pairingText;
  List<Wine>? productMatches;

  //full constructor
  WinePairingModel({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });


  // wine pairing object created from json
  factory WinePairingModel.fromJson(Map<String, dynamic> json) =>
      WinePairingModel(
        pairedWines: List<String>.from(json["pairedWines"].map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: List<Wine>.from(json["productMatches"].map((x) => Wine.fromJson(x))),
      );


  Map<String, dynamic> toJson() => {
    "pairedWines": List<dynamic>.from(pairedWines!.map((x) => x)),
    "pairingText": pairingText,
    "productMatches": List<Wine>.from(productMatches!.map((x) => x.toJson())),
  };


  // print pairings object (primarily for debugging purposes)
  @override
  String toString() {
    return 'Wine Pairings{'
        'pairedWines:= $pairedWines\n'
        'pairingText:= $pairingText\n'
        'productMatches:= $productMatches}'
    ;
  }
}

