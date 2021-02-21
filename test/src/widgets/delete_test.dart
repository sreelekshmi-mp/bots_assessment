
import 'package:bots_app/src/blocs/blocs.dart';
import 'package:bots_app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';


class UnknowState extends AppState {}

void main() {

  group('Display Home', () {
    testWidgets('Delete Page Test', (WidgetTester tester) async {
      await tester.pumpWidget(new MyApp());
      final titleFinder = find.text('Email');
      expect(titleFinder, findsOneWidget);
    });

  });
}