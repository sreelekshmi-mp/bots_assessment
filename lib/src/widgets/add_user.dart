import 'package:flutter/material.dart';
import 'package:bots_app/src/services/api_operations.dart';
import 'package:bots_app/src/widgets/alert_msg.dart';


class UserAddForm extends StatefulWidget {
  static String tag = 'add-page';
  @override
  _UserAddFormFormState createState() => new _UserAddFormFormState();
}

class _UserAddFormFormState extends State<UserAddForm> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();
  String _user_name = '';
  String _name = '';
  String _email = '';
  int _mobile_number = 0;
  String _website = '';
  bool _termsChecked = true;

  void onPressedSubmit() async {
    if (_formKey.currentState.validate() && _termsChecked) {
      _formKey.currentState.save();
      final service = API_Operations();
      print("Name " + _name);
      print("Email " + _email);
      print("Mobile Number " + _mobile_number.toString());
      print("Website " + _website);
      print("Termschecked " + _termsChecked.toString());
      Map updateData =
      {
        "name": _name,
        "username": _user_name,
        "email": _email,
        "phone": _mobile_number,
        "website": _website,
      };
      String response = await service.createUser(updateData);
      showAlertDialog(context, response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
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
    List<Widget> formWidget = [];

    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a name';
          }
        },
        onSaved: (value) {
          setState(() {
            _name = value;
          });
        }));

    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter UserName', hintText: 'UserName'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a username';
          }
        },
        onSaved: (value) {
          setState(() {
            _user_name = value;
          });
        }));
    formWidget.add(new TextFormField(
        decoration:
        InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: (value) {
          setState(() {
            _email = value;
          });
        }));

    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter Phone Number', hintText: 'Phone Number'),
        keyboardType: TextInputType.number,
        validator: phoneNumberValidator,
        onSaved: (value) {
          setState(() {
            _mobile_number = int.tryParse(value);
          });
        }));

    formWidget.add(new TextFormField(
        key: _passKey,
        decoration:
        InputDecoration(labelText: 'Enter Website', hintText: 'Website'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Website';
          }
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
        'I agree to add user to server.',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Add User'),
        onPressed: onPressedSubmit));
    formWidget.add(new RaisedButton(
      textColor: Colors.red,
      child: Text('Click to know about Add Operation'),
      onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The Add operation is used to add a new user with given details and is can be updated with Updated operation, can also be undone with delete operation with specific ID"
                "The operation uses the server https://jsonplaceholder.typicode.com/ and operates on user Data.",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 14.0, fontWeight:
              FontWeight.bold),), duration: Duration(seconds: 6), backgroundColor: Colors.blue,)
        );
      },
    ),);

    return formWidget;
  }
}