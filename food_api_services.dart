import 'package:dio/dio.dart';
import '../config/api_constants.dart';
import '../models/dish_pairing_model.dart';
import '../models/food_search_model.dart';
import '../models/recipe_result.dart';

class FoodApiServices {
  static final Dio dio = Dio();

  // returns food items based on ingredients of recipe
  static Future<RecipeResult?> searchRecipe(String ingredient) async {
    try {
      final response = await dio.get(
          "${ApiConstants.BASE_URL}/recipes/complexSearch?query=$ingredient",
          queryParameters: {
            "apiKey": ApiConstants.API_KEY,
          });
      if (response.statusCode == 200) {
        final result = RecipeResult.fromJson(response.data);
        return result;
      }
    } catch (e) {
      print(e);
      //throw Exception();
    }
    return null;
  }

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
      print(e);
      //throw Exception();
    }
    return null;
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
      print(e);
      //throw Exception();
    }
    return null;
  }
}
