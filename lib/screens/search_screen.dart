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
  final TextEditingController _searchQuery = new TextEditingController();
  List<User> _users;
  var _data;
  String _searchText = "";
  bool _isSearching;

  _get(searchUser) async {
    var data = await getData(searchUsers,
        variables: <String, dynamic>{"user": searchUser});
    final itemsTmp =
        data['search']['edges'].map((i) => new User.map(i['node']));
    final items = itemsTmp.cast<User>().toList();
    print(items[0]);
    setState(() {
      _users = itemsTmp;
    });
  }

  _SearchScreenState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
        _get(_searchText);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
      _searchText = "";
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _isSearching = false;
      _searchQuery.clear();
    });
  }

  List<UserTitle> _buildList() {
    return _users
        .map((user) => new UserTitle(user))
        .toList();
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
                  border: new Border.all(
                      color: Colors.white70,
                      width: 1.0
                  ),
                  borderRadius: new BorderRadius.circular(12.0)
              ),
              child: TextField(
                autofocus: true,
                controller: _searchQuery,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.all(8.0),
                      border: InputBorder.none,
                      prefixIcon: new Icon(Icons.search),
                      hintText: "Search Github Users",
                      labelStyle: new TextStyle(color: Colors.white)),
                onEditingComplete: () {
                  _handleSearchEnd();
                },

              ),
            ),
            Expanded(
              child: _users != null ?
              new ListView(children: _buildList())
                  : new Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ));
  }
}
