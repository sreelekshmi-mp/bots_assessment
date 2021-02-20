import 'package:flutter/material.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';
import 'package:flutter_movie_deep_dive_test/src/models/users.dart';
import 'package:flutter_movie_deep_dive_test/src/widgets/user_card.dart';

class UsersList extends StatelessWidget {
  final UsersResponse response;

  UsersList({@required this.response});

  @override
  Widget build(BuildContext context) {
    final users = response.users;
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        User user = users[index];
        return UserCard(
          key: Key("${user.id}"),
          data: user,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
