import 'package:flutter/material.dart';

class DeleteUser extends StatefulWidget {
  static String tag = 'deleteuser-page';
  @override
  _DeleteUserState createState() => new _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  int _id = 0;
  bool _termsChecked = true;

  void onPressedSubmit() {
    if (_formKey.currentState.validate() && _termsChecked) {
      _formKey.currentState.save();
      print("Mobile Number " + _id.toString());
      print("Termschecked " + _termsChecked.toString());
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Form Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
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

    return formWidget;
  }
}