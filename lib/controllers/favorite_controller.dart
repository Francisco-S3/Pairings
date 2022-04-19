import 'dart:core';
import 'package:pairings/models/favorites.dart';
import '../config/globals.dart' as globals;
import 'package:pairings/services/db_connector.dart';

class favoriteController {
  Future<bool> createFavorite(Favorite newFavorite) async {
    List<Favorite>? confirm =
        await DBconnect().createFav(newFavorite.favoriteToMap());
    if (confirm != null) {
      print(confirm.toString());
      return true;
    }
    return false;
    //}
    //<List<Favorite>?> createFav(Map<String, String> map){
  }

  Future<bool> readFavorite(int id) async {
    List<Favorite>? isFav = await DBconnect().readFav(id);
    if (isFav != null) {
      print(isFav.toString());
      return true;
    }
    return false;
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
