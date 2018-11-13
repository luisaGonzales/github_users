import 'package:flutter/material.dart';
import 'package:github_users/models/user_model.dart';

class UserTitle extends StatelessWidget {
  final User _user;
  const UserTitle(this._user);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    print(_user);
    return new Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: new BorderSide(color: Colors.grey))),
      child: new ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_user.avatarUrl),
        ),
        title: Text(
          "${_user.name}, ${_user.location != null ? _user.location : 'Not defined'} ",
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          _user.login,
          style: TextStyle(fontSize: 16.0),
        ),
        onTap: () {
          //Here navigate
        },
      ),
    );
  }
}
