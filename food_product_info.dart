import 'package:flutter/material.dart';
import 'package:pairings/models/dish_pairing_model.dart';
import 'package:pairings/models/food.dart';
import 'package:pairings/services/food_api_services.dart';
import 'package:pairings/views/saved.dart';
import '../services/food_api_services.dart';
import '../models/food_search_model.dart';

class FoodProductPage extends StatelessWidget {
  late final Food? foodResult;

  FoodProductPage({Key? key, required this.foodResult}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Text("${foodResult!.title.toString()}"),
    );
  }
}
