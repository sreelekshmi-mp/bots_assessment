import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bots_app/src/blocs/blocs.dart';
import 'package:bots_app/src/services/services.dart';
import 'package:bots_app/src/widgets/add_user.dart';
import 'package:bots_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:bots_app/src/widgets/app_intro.dart';
import 'package:bots_app/src/widgets/update_user.dart';
import 'package:bots_app/src/widgets/delete_user.dart';

class MyApp extends StatelessWidget {
  static String tag = 'app-page';
  final routes = <String, WidgetBuilder>{
    IntroScreen.tag: (context) => IntroScreen(),
    MyHomePage.tag: (context) => MyHomePage(),
    UserUpdateForm.tag: (context) => UserUpdateForm(),
    DeleteUser.tag: (context) => DeleteUser(),
    UserAddForm.tag: (context) => UserAddForm()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'BOTS for Testing',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        builder: (context) => AppBloc(
          service: Provider.of<AppService>(
            context,
            listen: false,
          ),
        ),
        child: MyHomePage(title: 'BOTS APP Testing'),
      ),
      routes: routes,
    );
  }
}
