import 'package:flutter/material.dart';
import 'package:github_users/models/user_model.dart';
import 'package:github_users/screens/components/UserTile.dart';
import 'package:github_users/utils/networks.dart';
import 'package:github_users/utils/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final key = new GlobalKey<ScaffoldState>();
  final myController = TextEditingController();

  List<User> _users;

  _get(searchUser) async {
    var data = await getData(searchUsers,
        variables: <String, dynamic>{"user": searchUser});
    final itemsTmp =
        data['search']['edges'].map((i) => new User.map(i['node']));
    final items = itemsTmp.cast<User>().toList();
    setState(() {
      _users = items;
    });
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_getUsers);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  _getUsers() {
    _get(myController.text);
  }

  List<UserTitle> _buildList() {
    return _users.map((user) => new UserTitle(user)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Github Users'),
          centerTitle: false,
        ),
        body: new Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              height: 50.0,
              decoration: new BoxDecoration(
                  color: Colors.black12,
                  border: new Border.all(color: Colors.white70, width: 1.0),
                  borderRadius: new BorderRadius.circular(12.0)),
              child: TextField(
                autofocus: true,
                controller: myController,
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    border: InputBorder.none,
                    prefixIcon: new Icon(Icons.search),
                    hintText: "Search Github Users",
                    labelStyle: new TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: _users != null
                  ? new ListView(children: _buildList())
                  : new Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ));
  }
}
