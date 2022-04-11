import 'package:http/http.dart' as http;
import '../models/favorites.dart';
import '../models/user.dart';

// HTTP response status codes indicate whether a specific HTTP request has been
// successfully completed. Responses are grouped in five classes:
// Informational responses (100–199)
// Successful responses (200–299)
// Redirection messages (300–399)
// Client error responses (400–499)
// Server error responses (500–599)

class DBconnect {
  // revised read email function call (returns boolean)
  Future<bool> checkEmail(String email) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/users/email=$email');
    var request = http.Request('GET', httpsUri);

    http.StreamedResponse response = await request.send();

    // statusCode '404:=Not Found' means existing email not found
    if (response.statusCode == 404) {
      // TRUE means didn't find so OK to proceed with account creation
      return true;
    }
    // FALSE means error, can't proceed with account creation
    print(
        'checkEmail status:=${response.statusCode}, reason:=${response.reasonPhrase}');
    return false;
  }

  // revised create new account function call (returns boolean)
  Future<bool> createAccount(Map<String, String> map) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com/api/users'));
    request.bodyFields = map;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    // statusCode '201:=Created' means successful POST response
    if (response.statusCode == 201) {
      return true;
    }
    // statusCode '302:=Found' means existing account found
    if (response.statusCode == 302) {
      print(
          'createAccount status:=${response.statusCode}, reason:=${response.reasonPhrase}');
      return false;
    }
    // other status codes
    print(
        'createAccount status:=${response.statusCode}, reason:=${response.reasonPhrase}');
    return false;
  }

  // revised authenticate function call
  Future<List<User>?> authenticate(var email, var password) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/authentication',
        queryParameters: {'email': email, 'password': password});
    var request = http.Request('GET', httpsUri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return userFromJson(json);
    }
    print(
        'authenticate status:=${response.statusCode}, reason:=${response.reasonPhrase}');
    return null;
  }

  Future<List<User>?> read(var id) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/users/$id');
    var request = http.Request('GET', httpsUri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return userFromJson(json);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<User>?> update(Map<String, String> map, var use) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/users/$use');
    var request = http.Request('PUT', httpsUri);
    request.bodyFields = map;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return userFromJson(json);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String?> delete(var id) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/users/$id');
    var request = http.Request('DELETE', httpsUri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }

  Future<String?> deleteFav(var id) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/favorites/$id');
    var request = http.Request('DELETE', httpsUri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }

  Future<List<Favorite>?> readFav(var id) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com',
        path: '/api/favorites/$id');
    var request = http.Request('GET', httpsUri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return favoriteFromJson(json);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<Favorite>?> createFav(Map<String, String> map) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://pairingsdbapi-env-1.eba-jcussjem.us-east-1.elasticbeanstalk.com/api/favorites'));
    request.bodyFields = map;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return favoriteFromJson(json);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
