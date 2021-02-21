import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:bots_app/src/providers/providers.dart';
import 'package:bots_app/src/widgets/widgets.dart';
import 'package:bots_app/src/app.dart';

import 'common.dart';

void main() {
  testWidgets('Display App', (WidgetTester tester) async {
    await tester.pumpWidget(AppProvider(
      httpClient: MockClient((request) async {
        return Response(json.encode(exampleJsonResponse), 200);
      }),
      child: MyApp(),
    ));

    Finder textFinder = find.byType(MyHomePage);
    expect(textFinder, findsOneWidget);
  });
}