// import 'package:flutter/material.dart';
// import 'package:bots_app/src/models/models.dart';
// import 'package:bots_app/src/widgets/widgets.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_test_utils/image_test_utils.dart';
//
// import '../common.dart';
//
// void main() {
//   MoviesResponse exampleResponse;
//
//   setUp(() {
//     exampleResponse = MoviesResponse.fromJson(exampleJsonResponse2);
//   });
//
//   testWidgets('Display Movies List', (WidgetTester tester) async {
//     provideMockedNetworkImages(() async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: MoviesList(
//               response: exampleResponse,
//             ),
//           ),
//         ),
//       );
//
//       Finder movieFinder = find.byType(MovieCard);
//       expect(movieFinder, findsNWidgets(2));
//
//       // Expect movie card from exampleJson
//       movieFinder = find.byKey(Key("1"));
//       expect(movieFinder, findsOneWidget);
//
//       movieFinder = find.byKey(Key("2"));
//       expect(movieFinder, findsOneWidget);
//     });
//   });
// }