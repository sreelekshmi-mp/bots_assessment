import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/src/widgets/delete_user.dart';


void main() {

  Widget makeTestableWidget({Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  void enter_id(WidgetTester tester) async
  {
    final textfield = await find.byKey(Key('del_textfield_id'));
    expect(textfield, findsOneWidget);
    await tester.enterText(textfield, '1');
  }

  void startActivityDeleteUserPage(WidgetTester tester) async
  {
    DeleteUser page = DeleteUser();
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
    final submit = await find.byKey(Key('del_submit'));
    expect(submit, findsOneWidget);
    await tester.tap(submit);
    await tester.pump(const Duration(seconds: 20));
  }

  void selectCheckbox(WidgetTester tester) async {
    final checkbox = await find.byKey(Key('del_agree_checkbox'));
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
  }


  group('Delete User Page', () {
    testWidgets('Delete User with id', (WidgetTester tester) async {
      await startActivityDeleteUserPage(tester);
      await enter_id(tester);
      await submit(tester);
      await validateSuccess(tester, 1);
    });

    testWidgets('Delete User submit without entering id', (WidgetTester tester) async {
      await startActivityDeleteUserPage(tester);
      await submit(tester);
      await validateSuccess(tester, 0);
    });

    testWidgets('Delete User submit without agree checked', (WidgetTester tester) async {
      await startActivityDeleteUserPage(tester);
      await enter_id(tester);
      await selectCheckbox(tester);
      await submit(tester);
      await validateSuccess(tester, 0);
    });

  });
}