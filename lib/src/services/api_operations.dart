import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_deep_dive_test/src/models/users.dart';
import 'package:http/http.dart' show Response, delete, get;


class API_Operations {

  final base_url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUser() async {
    Response res = await get(Uri.parse(base_url));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
      )
          .toList();

      return users;
    } else {
      throw "Can't get User Details.";
    }
  }

  Future<String> createUser(Map data) async{

    final jsonData =
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
        "name": "N.A",
        "catchPhrase": "N.A",
        "bs": "N.A"
      }
    };
    HttpClientRequest request = await HttpClient().postUrl(Uri.parse(base_url));
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(jsonData));
    HttpClientResponse response = await request.close();
    debugPrint("#############");
    debugPrint(response.statusCode.toString());
    debugPrint("#############");
    if(response.statusCode == 201){
      return "User created successfully";// $user.id";
    }else{
      return "Creation Unsuccessful";
    }
  }


  Future<String> deleteUser(int id) async {
    Response res = await delete("$base_url/$id");

    if (res.statusCode == 200) {
      String msg = "user id :$id Deleted Succesfully";
      debugPrint(msg);
      return msg;
    } else {
      return "couldn't delete user with id:$id";
    }
  }

  Future<String> updateUser(Map data) async {
    Uri uri = Uri.parse("$base_url/$data['id']");
    final httpClient = HttpClient();
    final request = await httpClient.putUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(data));

    final response = await request.close();
    if (response.statusCode != 204) {
      return "Update Unsuccessful";
    }
    final responseBody = await response.transform(utf8.decoder).join();
    debugPrint(responseBody.toString());
    return "Update Successful for ID:$data['id']";
  }
}


