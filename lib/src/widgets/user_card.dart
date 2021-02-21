import 'package:flutter/material.dart';
import 'package:bots_app/src/models/users.dart';

class UserCard extends StatelessWidget {
  final User data;

  const UserCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 284,
              //   child: Image.network(
              //     data.posterPathResolved,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.name,
                  key: Key("${data.id}-title"),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text(
                data.username,
                key: Key("${data.id}-overview"),
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    Text('Email-ID:'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          data.email,
                          key: Key("${data.id}-Email_ID"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
