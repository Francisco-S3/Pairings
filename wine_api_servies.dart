import 'package:dio/dio.dart';
import '../config/api_constants.dart';
import '../models/wine_pairing_model.dart';
import '../models/wine_recommendation_model.dart';

/// Wine API Services
/// api queries related to wine related searches
class WineApiServices {
  static final Dio dio = Dio();

  // returns recommended wines to pair with the food parameter
  static Future<WinePairingModel?> getWinePairing(String foodName) async {
    try {
      final response = await dio.get(
          "${ApiConstants.BASE_URL}/food/wine/pairing?food=$foodName",
          queryParameters: {
            "apiKey": ApiConstants.API_KEY,
          });

      if (response.statusCode == 200) {
        return WinePairingModel.fromJson(response.data);
      }
    } catch (e) {
      print('Error:= $e');
    }
    return null;
  }

  // returns recommended wines based on the wine type parameter
  static Future<WineRecommendationModel?> getWineRecommendation(
      String wine) async {
    try {
      final response = await dio.get(
          "${ApiConstants.BASE_URL}/food/wine/recommendation?wine=$wine&number=10",
          queryParameters: {
            "apiKey": ApiConstants.API_KEY,
          });
      if (response.statusCode == 200) {
        return WineRecommendationModel.fromJson(response.data);
      }
    } catch (e) {
      print('Error:= $e');
    }
    return null;
  }
}
