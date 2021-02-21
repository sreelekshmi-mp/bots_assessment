// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Bots App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('User List Displayed on Home screen E2E', () async {
      // User 1
      SerializableFinder titleTextFinder1 = find.byValueKey('200-user');
      SerializableFinder overviewTextFinder1 = find.byValueKey('200-username');
      SerializableFinder releaseTextFinder1 = find.byValueKey('200-email_id');

      expect(await driver.getText(titleTextFinder1), 'Sree lekshmi');
      expect(await driver.getText(overviewTextFinder1), 'Sree');
      expect(await driver.getText(releaseTextFinder1), 'Sree@melissa.tv');

      // User 2
      SerializableFinder titleTextFinder2 = find.byValueKey('300-user');
      SerializableFinder overviewTextFinder2 = find.byValueKey('300-username');
      SerializableFinder releaseTextFinder2 = find.byValueKey('300-email_id');

      expect(await driver.getText(titleTextFinder2), 'Clementine Bench');
      expect(await driver.getText(overviewTextFinder2), 'Samantha');
      expect(await driver.getText(releaseTextFinder2), 'Nathan@yesenia.net');
    });
  });
}