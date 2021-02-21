import 'dart:convert';

import 'package:bots_app/src/services/services.dart';
import 'package:flutter/cupertino.dart';
import "package:bots_app/src/services/api_operations.dart";
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:bots_app/src/models/users.dart';

import '../common.dart';

main() {
  group('getUser', () {
    test('status == 200', () async {
      final mockClient = MockClient((request) async {
        return Response(json.encode(exampleJsonResponse), 200);
      });
      final service = AppService(mockClient);
      final UsersResponse expectedResponse = UsersResponse.fromJson(exampleJsonResponse[0], exampleJsonResponse);
      final actualResponse = await service.loadUsers();
      expect(actualResponse.users.length, equals(expectedResponse.users.length));
    });

    test('status != 200', () async {
      final mockClient = MockClient((request) async {
        return Response(json.encode(exampleJsonResponse), 500);
      });
      final service = API_Operations();
      service.mock_url("https://jsonplaceholder.typicode.com/user");
      expect(
        () async => await service.getUser(),
        throwsA(predicate((e) =>
            e is LoadUsersException &&
            e.message == "Can't get User Details.")),
      );
    });
  });
}