import 'dart:core';
import 'package:pairings/models/favorites.dart';
import '../config/globals.dart' as globals;
import 'package:pairings/services/db_connector.dart';

class FavoriteController {

  static Future<bool> createFavorite(String foodId, String wineId) async {

    Favorite fav = Favorite(
      id: 0,
      userId: globals.currentUser.id.toString(),
      foodId: foodId,
      wineId: wineId,
    );
    return await DBconnect().createFav(fav.favoriteToMap());
  }


  static Future<List<Favorite>?> readFavorite(int id) async {
    List<Favorite>? isFav = await DBconnect().getFav(id);
    if (isFav != null) {
      print(isFav.toString());
    }
    return isFav;
  }


  Future<bool> deleteFavorite(int id) async {
    String? delFav = await DBconnect().deleteFav(id);
    if (delFav != null) {
      print(delFav.toString());
      return true;
    }
    return false;
  }
}
