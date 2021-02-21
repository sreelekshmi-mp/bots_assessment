
import 'package:bots_app/src/blocs/blocs.dart';
import 'package:bots_app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';


class UnknowState extends AppState {}

void main() {

  group('Display Home', () {
    testWidgets('Delete Page Test', (WidgetTester tester) async {
      await tester.pumpWidget(new MyApp());
      final titleFinder = find.text('Email');
      // final messageFinder = find.text('M');

      // Use the `findsOneWidget` matcher provided by flutter_test to verify
      // that the Text widgets appear exactly once in the widget tree.
      expect(titleFinder, findsOneWidget);
      // expect(messageFinder, findsOneWidget);
      // Finder textFinder = find.byType(CircularProgressIndicator);
      // expect(textFinder, findsOneWidget);
    });

  });
}