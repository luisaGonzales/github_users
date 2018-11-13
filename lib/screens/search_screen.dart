import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Users'),
        centerTitle: false,
      ),
      body: Query(
        searchUsers,
        variables: {'name': "luisaGonzales"},
        builder: ({
          bool loading,
          var data,
          Exception error,
        }) {
          if (error != null) {
            return Text(error.toString());
          } else {
            print(error);
          }

          if (loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(data);
          }

          List feedList = data['search']['edges'];

          return ListView.builder(
            itemCount: feedList.length,
            itemBuilder: (context, index) {
              final feedListItems = feedList[index];
              return new Container(
                  decoration:
                  new BoxDecoration(
                      border: new Border(
                          bottom: new BorderSide(
                            color: Colors.grey
                          )
                      )
                  ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    NetworkImage(feedListItems['node']['avatarUrl']),
                  ),
                  title: Text(
                    "${feedListItems['node']['name']}, ${feedListItems['node']['location'] != null ? feedListItems['node']['location'] : 'Not defined'} ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    feedListItems['node']['login'],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String searchUsers = """
 query SearchUsers{
  search(query: "Luisa Gonzales", type: USER, first: 10) {
    edges {
      node {
        ... on User {
          name
          avatarUrl
          location
          login
        }
      }
    }
  }
}
"""
    .replaceAll('\n', ' ');
