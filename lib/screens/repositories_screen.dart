import 'package:flutter/material.dart';
import 'package:github_users/utils/networks.dart';
import 'package:github_users/utils/queries.dart';
import 'package:github_users/models/repository_model.dart';

class RepositoriesScreen extends StatefulWidget {
  final String name;
  final String login;

  RepositoriesScreen({Key key, this.name, this.login}) : super(key: key);
  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  List<Repository> _repositories;

  _getRepositories(login) async {
    var data = await getData(getRepositories,
        variables: <String, dynamic>{"login": login});
    final itemsTmp =
    data['repositories']['edges'].map((i) => new Repository.map(i['node']));
    final items = itemsTmp.cast<Repository>().toList();
    setState(() {
      _repositories = items;
    });
  }


  @override
  void initState() {
    super.initState();
    _getRepositories(widget.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
    );
  }
}
