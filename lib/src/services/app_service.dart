import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:bots_app/src/models/users.dart';
import 'package:http/http.dart' show Client;

class LoadUsersException implements Exception {
  final message;

  LoadUsersException(this.message);
}

// class AddUsersException implements Exception {
//   final message;
//
//   AddUsersException(this.message);
// }

class AppService {
  final Client client;
  final api = 'https://jsonplaceholder.typicode.com';
  final urlPath = 'users';


  AppService(this.client);

  Future<UsersResponse> loadUsers() async {
    final path = '$api/$urlPath';
    final response = await client.get(path);
    if (response.statusCode != 200) {
      throw LoadUsersException('Users - Request Error: ${response.statusCode}');
    }
    final data = json.decode(response.body);
    return UsersResponse.fromJson(data[0], data);
  }

  Future<String> addUser(Map data) async {
    Map jsonData =
    {
      "name": data["name"],
      "username": data["username"],
      "email": data["email"],
      "address": {
        "street": "N.A",
        "suite": "N.A",
        "city": "N.A",
        "zipcode": "N.A",
        "geo": {
          "lat": "N.A",
          "lng": "N.A"
        }
      },
      "phone": data["phone"],
      "website": data["website"],
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    };

    Uri uri = Uri.parse('$api/$urlPath');
    HttpClientRequest request = await HttpClient().postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(jsonData));
    HttpClientResponse response = await request.close();
    if (response.statusCode < 200 || response.statusCode > 399)
    {
      //throw LoadUsersException('Users - Request Error: ${response.statusCode}');
      return "User Creation Failed";
    }
    response.transform(utf8.decoder).listen((contents) {
      debugPrint(contents);
    });
    return "User Creation Unsuccessful";
  }

  Future<String> DeleteUser(String id) async {
    final path = "$api/$urlPath/$id";
    Uri uri = Uri.parse(path);
    final httpClient = HttpClient();
    final request = await httpClient.deleteUrl(uri);
    request.headers.contentType = ContentType.json;
    final response = await request.close();
    if (response.statusCode != 200) {
      return "Delete Unsuccessful";
    }
    final responseBody = await response.transform(utf8.decoder).join();
    debugPrint(responseBody.toString());
    return "Delete Successful for ID:$id";
  }

  Future<String> PUTUser(Map data) async {
    final path = "$api/$urlPath/$data['id']";
    Uri uri = Uri.parse(path);
    final httpClient = HttpClient();
    final request = await httpClient.putUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(data));

    final response = await request.close();
    if (response.statusCode < 200 || response.statusCode > 399) {
      return "Update Unsuccessful";
    }
    final responseBody = await response.transform(utf8.decoder).join();
    debugPrint(responseBody.toString());
    return "Update Successful for ID:$data['id']";
  }
}


