import 'package:flutter/material.dart';
import 'package:bots_app/src/models/users.dart';
import 'package:bots_app/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import '../common.dart';

void main() {
  UsersResponse exampleResponse;

  setUp(() {
    exampleResponse = UsersResponse.fromJson(exampleJsonResponse2[0], exampleJsonResponse2);
  });

  testWidgets('Display Movies List', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsersList(
              response: exampleResponse,
            ),
          ),
        ),
      );

      Finder userFinder = find.byType(UserCard);
      expect(userFinder, findsNWidgets(2));

      // Expect movie card from exampleJson
      userFinder = find.byKey(Key("200"));
      expect(userFinder, findsOneWidget);

      userFinder = find.byKey(Key("300"));
      expect(userFinder, findsOneWidget);
    });
  });
}