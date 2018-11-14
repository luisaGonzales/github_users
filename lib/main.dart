import 'package:flutter/material.dart';
import 'package:github_users/utils/routes.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:github_users/utils/networks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ValueNotifier<Client> client = ValueNotifier(customClient);

    return GraphqlProvider(
        client: client,
        child: MaterialApp(
          title: 'Github Users',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          routes: routes,
        ));
  }
}
