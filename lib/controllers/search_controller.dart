import '../models/food_search_model.dart';
import '../services/food_api_services.dart';

// FoodSearchResult convertToModel(List<FoodSearchResult> result) {
//   FoodSearchResult tempModel = result[0];
// }

Future<FoodSearchModel?> searchController(String searchText) async {
  // call to api using wine type as search criteria
  return await FoodApiServices.searchFood(searchText);
}
