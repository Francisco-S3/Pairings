import 'dart:convert';

<<<<<<< HEAD

=======
>>>>>>> main
DishPairingModel dishPairingModelFromJson(String str) =>
    DishPairingModel.fromJson(json.decode(str));

String dishPairingModelToJson(DishPairingModel data) =>
    json.encode(data.toJson());

class DishPairingModel {
  DishPairingModel({
    this.pairings,
    this.text,
  });

  List<String>? pairings;
  String? text;

  factory DishPairingModel.fromJson(Map<String, dynamic> json) =>
      DishPairingModel(
        pairings: List<String>.from(json["pairings"].map((x) => x)),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "pairings": List<dynamic>.from(pairings!.map((x) => x)),
        "text": text,
      };
}
