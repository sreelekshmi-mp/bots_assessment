import 'package:flutter/material.dart';
import 'package:flutter_movie_deep_dive_test/src/models/users.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import '../common.dart';

void main() {
  UsersResponse exampleResponse;

  setUp(() {
    exampleResponse = UsersResponse.fromJson(exampleJsonResponse2, exampleJsonResponse2["results"]);
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

      Finder movieFinder = find.byType(UserCard);
      expect(movieFinder, findsNWidgets(2));

      // Expect movie card from exampleJson
      movieFinder = find.byKey(Key("1"));
      expect(movieFinder, findsOneWidget);

      movieFinder = find.byKey(Key("2"));
      expect(movieFinder, findsOneWidget);
    });
  });
}