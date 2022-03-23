import 'dart:convert';
import 'package:http/http.dart' as http;

Map? user;

//CREATE: api call to create a new user, takes a map with all the required
// fields to create user.
Future<Map?> create(Map<String, String> map) async {
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'http://pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com/api/users'));
  request.bodyFields = map;
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    user = jsonToMap(json.decode(await response.stream.bytesToString()));
  } else {
    print(response.reasonPhrase);
  }

  return user;
}

// READ: api call to get a specific users information, using id or email.
Future<Map?> read(var use) async {
  var httpsUri = Uri(
      scheme: 'http',
      host: 'pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com',
      path: '/api/users/$use');
  var request = http.Request('GET', httpsUri);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // List<dynamic> tempUser = json.decode(await response.stream.bytesToString());
    user = jsonToMap(json.decode(await response.stream.bytesToString()));
    print(user!['email']);
  } else {
    print(response.reasonPhrase);
  }
  return user;
}

// UPDATE: api call to update the users information, take a map and user id as parameters.
Future<Map?> update(Map<String, String> map, var use) async {
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
    user = json.decode(await response.stream.bytesToString());
    print(user!['firstName']);
  } else {
    print(response.reasonPhrase);
  }

  return user;
}

// DELETE: api call to delete a user from db using thier user id as the parameter.
Future<String?> delete(var use) async {
  var httpsUri = Uri(
      scheme: 'http',
      host: 'pairingsdbapi-env.eba-28k5s73x.us-east-1.elasticbeanstalk.com',
      path: '/api/users/$use');
  var request = http.Request('DELETE', httpsUri);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return await response.stream.bytesToString();
  } else {
    return response.reasonPhrase;
  }
}

// Helper method to turn json respones to a map for further use.
Map<dynamic, dynamic> jsonToMap(List jList) {
  Map newMap = jList[0];
  return newMap;
}
