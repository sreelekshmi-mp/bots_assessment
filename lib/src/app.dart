import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_deep_dive_test/src/blocs/blocs.dart';
import 'package:flutter_movie_deep_dive_test/src/services/services.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/app_intro.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/update_user.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/delete_user.dart';

class MyApp extends StatelessWidget {
  static String tag = 'app-page';
  final routes = <String, WidgetBuilder>{
    IntroScreen.tag: (context) => IntroScreen(),
    MyHomePage.tag: (context) => MyHomePage(),
    UserAddUpdateForm.tag: (context) => UserAddUpdateForm(),
    DeleteUser.tag: (context) => DeleteUser()
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
