import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/src/widgets/add_user.dart';


void main() {

  Widget makeTestableWidget({Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  void enter_details(WidgetTester tester, Map userDetail) async
  {
    final keys = ["add_nameField", "add_userNameField", "add_emailField", "add_phoneNoField", "add_websiteField"];
    for(String key in keys) {
      final textfield = await find.byKey(Key(key));
      debugPrint(key + ":" + userDetail[key]);
      expect(textfield, findsOneWidget);
      await tester.enterText(textfield, userDetail[key]);
    }
  }

  void startActivityAddUserPage(WidgetTester tester) async
  {
    UserAddForm page = UserAddForm();
    await tester.pumpWidget(makeTestableWidget(child: page));
  }

  void validateSuccess(WidgetTester tester, int positive) async
  {
    final successful = find.text("OK");

    if(positive == 1) {
      expect(successful, findsOneWidget);
      await tester.tap(successful);
    }
    else{
      expect(successful, findsNothing);}
  }

  void submit(WidgetTester tester) async {
    final submit = await find.byKey(Key('add_submit'));
    expect(submit, findsOneWidget);
    await tester.tap(submit);
    await tester.pump(const Duration(seconds: 40));
  }

  void selectCheckbox(WidgetTester tester) async {
    final checkbox = await find.byKey(Key('add_agree_checkbox'));
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
  }


  group('Add User Page', () {
    testWidgets('Add User successfully', (WidgetTester tester) async {
      Map userDetails = {
        "add_nameField": "SreeLekshmi",
        "add_userNameField": "Sree",
        "add_emailField": "sree@gmail.com",
        "add_phoneNoField": "8053280174",
        "add_websiteField": "www.mockhost.com",
      };
      await startActivityAddUserPage(tester);
      await enter_details(tester, userDetails);
      await submit(tester);
      await validateSuccess(tester, 1);
    });

    testWidgets('Add User submit with missing Name fields', (WidgetTester tester) async {
      Map userDetails = {
        "add_nameField": "",
        "add_userNameField": "Sree",
        "add_emailField": "sree@gmail.com",
        "add_phoneNoField": "8053280174",
        "add_websiteField": "www.mockhost.com",
      };
      await startActivityAddUserPage(tester);
      await enter_details(tester, userDetails);
      await submit(tester);
      await validateSuccess(tester, 0);
    });

    testWidgets('Add User submit with wrong phone No fields', (WidgetTester tester) async {
      Map userDetails = {
        "add_nameField": "SreeLekshmi",
        "add_userNameField": "Sree",
        "add_emailField": "sree@gmail.com",
        "add_phoneNoField": "80532801740", // add 11 numbers
        "add_websiteField": "www.mockhost.com",
      };
      await startActivityAddUserPage(tester);
      await enter_details(tester, userDetails);
      await submit(tester);
      await validateSuccess(tester, 0);
    });

    testWidgets('Add User submit with invalid email id fields', (WidgetTester tester) async {
      Map userDetails = {
        "add_nameField": "SreeLekshmi",
        "add_userNameField": "Sree",
        "add_emailField": "sree", // invalida email id
        "add_phoneNoField": "8053280174",
        "add_websiteField": "www.mockhost.com",
      };
      await startActivityAddUserPage(tester);
      await enter_details(tester, userDetails);
      await submit(tester);
      await validateSuccess(tester, 0);
    });

    testWidgets('Add User submit without agree checked', (WidgetTester tester) async {
      Map userDetails = {
        "add_nameField": "SreeLekshmi",
        "add_userNameField": "Sree",
        "add_emailField": "sree@gmail.com",
        "add_phoneNoField": "8053280174",
        "add_websiteField": "www.mockhost.com",
      };
      await startActivityAddUserPage(tester);
      await enter_details(tester, userDetails);
      await selectCheckbox(tester);
      await submit(tester);
      await validateSuccess(tester, 0);
    });

  });
}