import 'package:flutter_test/flutter_test.dart';
import 'package:bots_app/src/models/users.dart';

main() {
  group('user.name', () {
    test('user name is null', () {
      User user = User();
     expect(user.name, equals(null));
    });

    test('UserName is valid', () {
      User user = User(name: 'some-value');
      expect(user.name, equals('some-value'));});
  });
}