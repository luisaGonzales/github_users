import 'package:flutter/material.dart';
import 'package:github_users/models/user_model.dart';
import 'package:github_users/screens/repositories_screen.dart';

class UserTitle extends StatelessWidget {
  final User _user;
  const UserTitle(this._user);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: new BorderSide(color: themeData.dividerColor))),
      child: new ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: _user.avatarUrl != null ? NetworkImage(_user.avatarUrl) : NetworkImage('https://cdn3.iconfinder.com/data/icons/ultimate-social/150/48_github-512.png'),

          ),
          title: Text(
            "${_user.name}, ${_user.location != null ? _user.location : 'Not defined'} ",
            maxLines: 1,
            style: TextStyle(
                fontSize: 18.0,
            ),
          ),
          subtitle: Text(
            "${_user.login}",
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new RepositoriesScreen(name: _user.name, login: _user.login)));
          }),
    );
  }
}
