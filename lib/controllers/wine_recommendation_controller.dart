import 'package:pairings/models/wine_recommendation_model.dart';
import 'package:pairings/services/wine_api_servies.dart';


/// Wine Recommendation Controller
/// used for retrieving wine suggestions from Spoonacular api.
/// Takes a string representing the type of wine as parameter and returns a
/// list of wines matching the criteria.
Future<WineRecommendationModel?> recommendationController(String wineName) async {

    // call to api using wine type as search criteria
    return await WineApiServices.getWineRecommendation(wineName);
}
