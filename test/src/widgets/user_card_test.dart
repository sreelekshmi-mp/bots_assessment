import 'package:flutter/material.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/models/users.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import '../common.dart';

void main() {
  UsersResponse exampleResponse;
  User user;

  setUp(() {
    exampleResponse = UsersResponse.fromJson(exampleJsonResponse, exampleJsonResponse["results"]);
    user = exampleResponse.users.first;
  });

  testWidgets('Display User Card', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserCard(
              key: Key("${user.id}"),
              data: user,
            ),
          ),
        ),
      );

      final movieFinder = find.byType(UserCard);
      expect(movieFinder, findsOneWidget);

      Finder textFinder = find.text(user.name);
      expect(textFinder, findsOneWidget);

      textFinder = find.text(user.email);
      expect(textFinder, findsOneWidget);

      textFinder = find.text(user.phone);
      expect(textFinder, findsOneWidget);
    });
  });
}