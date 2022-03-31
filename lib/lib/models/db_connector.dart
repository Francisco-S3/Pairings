import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class DBconnect {
  Future<List<User>?> create(Map<String, String> map) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com/api/users'));
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

  Future<List<User>?> read(var id) async {
    var httpsUri = Uri(
        scheme: 'http',
        host: 'pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com',
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
        host: 'pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com',
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
        host: 'pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com',
        path: '/api/users/$id');
    var request = http.Request('DELETE', httpsUri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }
}
