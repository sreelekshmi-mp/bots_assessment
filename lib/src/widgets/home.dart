import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bots_app/src/blocs/app_event.dart';
import 'package:bots_app/src/blocs/blocs.dart';
import 'package:bots_app/src/widgets/add_user.dart';
import 'package:bots_app/src/widgets/delete_user.dart';
import 'package:bots_app/src/widgets/app_intro.dart';
import 'package:bots_app/src/widgets/update_user.dart';
import 'package:bots_app/src/widgets/users_list.dart';
import 'package:http/http.dart' show Client;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  static String tag = 'home-page';
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppBloc>(context).add(FetchEvent());
  }

  Drawer _buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Image.asset(
                  "assets/imgs/bots_logo.png",
                ),
              ),
            ),
              ListTile(title: Text('Bots App Tutorial'),
              onTap: () {
                Navigator.of(context).pushNamed(IntroScreen.tag);
              // Update the state of the app
              // ...
              },
              ),
            ListTile(title: Text('View Users Data'),
              onTap: () {
                Navigator.pop(context);
                // Update the state of the app
                // ...
              },
            ),
            ListTile(title: Text('Add User Data'),
              onTap: () {
                Navigator.of(context).pushNamed(UserAddForm.tag);
                // Update the state of the app
                // ...
              },
            ),
            ListTile(title: Text('Update User Data'),
              onTap: () {
                Navigator.of(context).pushNamed(UserUpdateForm.tag);
                // Update the state of the app
                // ...
              },
            ),
            ListTile(title: Text('Delete User Data'),
              onTap: () {
                Navigator.of(context).pushNamed(DeleteUser.tag);
                // Update the state of the app
                // ...
              },
            ),
              ListTile(
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
              children: <Widget>[
              Expanded(child: RaisedButton(onPressed: () {Navigator.pop(context);},child: Text("Exit"),color: Colors.black,textColor: Colors.white,))
              ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: _buildDrawer(),
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is AppLoaded) {
            // Nothing to do
          }
        },
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          // Is Loading
          if (state is AppLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // Is Loaded
          if (state is AppLoaded) {
            print(UsersList(response: state.response));
            return UsersList(response: state.response);
          }

          // State error
          if (state is AppError) {
            return Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          }
          return Center(child: Text('Wait ...'));
        }),
      ),
    );
  }
}
