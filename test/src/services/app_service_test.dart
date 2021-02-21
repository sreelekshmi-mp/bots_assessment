import 'dart:convert';

import 'package:bots_app/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:bots_app/src/models/users.dart';

import '../common.dart';

main() {
  group('loadUsers', () {
    test('status == 200', () async {
      final mockClient = MockClient((request) async {
        return Response(json.encode(exampleJsonResponse), 200);
      });
      final service = AppService(mockClient);
      final expectedResponse = UsersResponse.fromJson(exampleJsonResponse, exampleJsonResponse[0]);
      final actualResponse = await service.loadUsers();
      expect(actualResponse, equals(expectedResponse));
    });

    test('status != 200', () async {
      final mockClient = MockClient((request) async {
        return Response(json.encode(exampleJsonResponse), 500);
      });
      final service = AppService(mockClient);
      expect(
        () async => await service.loadUsers(),
        throwsA(predicate((e) =>
            e is LoadUsersException &&
            e.message == 'LoadUsers - Request Error: 500')),
      );
    });
  });
}