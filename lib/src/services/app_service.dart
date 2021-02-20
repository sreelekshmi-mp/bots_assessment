import 'dart:convert';

import 'package:flutter_movie_deep_dive_test/src/models/users.dart';
import 'package:http/http.dart' show Client;

class LoadUsersException implements Exception {
  final message;

  LoadUsersException(this.message);
}

class AppService {
  final Client client;

  AppService(this.client);

  Future<UsersResponse> loadUsers() async {
    //final apiKey = '4205ec1d93b1e3465f636f0956a98c64';
    final api = 'https://jsonplaceholder.typicode.com';
    final urlPath = 'users';
    final path = '$api/$urlPath';

    // appel asynchrone
    final response = await client.get(path);

    if (response.statusCode != 200) {
      throw LoadUsersException('Users - Request Error: ${response.statusCode}');
    }

    // Décoder le contenu de la response ici
    final data = json.decode(response.body);

    return UsersResponse.fromJson(data[0], data);
  }
}
