import 'package:pairings/models/wine_pairing_model.dart';
import 'package:pairings/services/wine_api_servies.dart';


/// Pairing Controller
/// used for retrieving food/wine pairings from Spoonacular api.
/// Takes a string representing the type of food as parameter and returns a
/// wine pairing object.
Future<WinePairingModel?> pairingController(String foodName) async {

    // call to api using food as search criteria
    return await WineApiServices.getWinePairing(foodName);
}
