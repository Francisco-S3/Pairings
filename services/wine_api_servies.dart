import 'package:dio/dio.dart';
import '../config/api_constants.dart';
import '../models/wine_pairing_model.dart';
import '../models/wine_recommendation_model.dart';

class WineApiServices {
  static final Dio dio = Dio();

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
      throw Exception();
    }
  }

  static Future<WineRecommendationModel?> getWineRecommendation(
      String wine) async {
    final response = await dio.get(
        "${ApiConstants.BASE_URL}/food/wine/recommendation?wine=$wine&number=10",
        queryParameters: {
          "apiKey": ApiConstants.API_KEY,
        });
    if (response.statusCode == 200) {
      return WineRecommendationModel.fromJson(response.data);
    }
  }
}
