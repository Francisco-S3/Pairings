import 'package:flutter/material.dart';
import 'package:pairings/models/dish_pairing_model.dart';
import 'package:pairings/services/food_api_services.dart';
import 'package:pairings/views/saved.dart';
import '../services/food_api_services.dart';
import '../models/dish_pairing_model.dart';

class ProductPage extends StatefulWidget {
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late DishPairingModel? result;
  List<String>? dishPairings = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future init() async {
    final result = await FoodApiServices.getDishPairing('Cabernet Sauvignon');
    final dishPairings = result?.pairings;

    setState(() {
      this.dishPairings = dishPairings;
      this.result = result;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: dishPairings == null ? 0 : dishPairings?.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text(
                dishPairings![index],
                style: TextStyle(color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }
}
