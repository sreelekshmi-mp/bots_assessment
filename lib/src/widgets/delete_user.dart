import 'package:flutter/material.dart';
import 'package:bots_app/src/services/api_operations.dart';
import 'package:bots_app/src/widgets/alert_msg.dart';

class DeleteUser extends StatefulWidget {
  static String tag = 'deleteuser-page';
  @override
  _DeleteUserState createState() => new _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();
  final service = API_Operations();
  final mainScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  int _id = 0;
  bool _termsChecked = true;

  void onPressedSubmit() async {
    if (_formKey.currentState.validate() && _termsChecked) {
      _formKey.currentState.save();
      print("ID" + _id.toString());
      print("Termschecked " + _termsChecked.toString());
      String response = await service.deleteUser(_id);
      showAlertDialog(context, response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: mainScaffoldMessengerKey,
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget()
        ),
      ),


    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter ID to delete', hintText: 'ID'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter ID to delete';
          }
        },
        onSaved: (value) {
          setState(() {
            _id = int.tryParse(value);
          });
        }));


    formWidget.add(CheckboxListTile(
      value: _termsChecked,
      onChanged: (value) {
        setState(() {
          _termsChecked = value;
        });
      },
      subtitle: !_termsChecked
          ? Text(
        'Required',
        style: TextStyle(color: Colors.red, fontSize: 12.0),
      )
          : null,
      title: new Text(
        'I agree to delete user on server.',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Delete User'),
        onPressed: onPressedSubmit));
    formWidget.add(new RaisedButton(
      textColor: Colors.red,
      child: Text('Click to know about Delete Operation'),
      onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The delete operation is used to delete the existing user with the help of ID and it cannot be undone."
                "The operation uses the server https://jsonplaceholder.typicode.com/ and operates on user Data.",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 14.0, fontWeight:
              FontWeight.bold),), duration: Duration(seconds: 6), backgroundColor: Colors.blue,)
        );
      },
    ),);
    return formWidget;
  }
}