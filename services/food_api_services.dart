import 'package:dio/dio.dart';
<<<<<<< HEAD
import 'package:pairings/config/api_constants.dart';
import 'package:pairings/models/dish_pairing_model.dart';
import 'package:pairings/models/food_search_model.dart';

=======
import 'package:wine_app/config/api_constants.dart';
import 'package:wine_app/models/dish_pairing_model.dart';
import 'package:wine_app/models/food_search_model.dart';
>>>>>>> main

class FoodApiServices {
  static final Dio dio = Dio();

  static Future<FoodSearchModel?> searchFood(String searchText) async {
    try {
      final response = await dio.get(
          "${ApiConstants.BASE_URL}/food/search?query=$searchText",
          queryParameters: {
            "apiKey": ApiConstants.API_KEY,
          });
      if (response.statusCode == 200) {
        final results = FoodSearchModel.fromJson(response.data);
        return results;
      }
    } catch (e) {
      throw Exception();
    }
  }

  static Future<DishPairingModel?> getDishPairing(String wineName) async {
    try {
      final response = await dio.get(
          "${ApiConstants.BASE_URL}/food/wine/dishes?wine=$wineName",
          queryParameters: {
            "apiKey": ApiConstants.API_KEY,
          });
      if (response.statusCode == 200) {
        final result = DishPairingModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      throw Exception();
    }
  }
}
