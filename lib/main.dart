import 'package:flutter/material.dart';
import 'package:github_users/utils/routes.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ValueNotifier<Client> client = ValueNotifier(
      Client(
        endPoint: 'https://api.github.com/graphql',
        cache: InMemoryCache(),
        apiToken: '<GITHUB_PERSONAL_ACCESS_TOKEN>',
      ),
    );

    return GraphqlProvider(
      client: client,
      child: CacheProvider(
          child: MaterialApp(
            title: 'Github Users',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            routes: routes,
          )
      ),
    );
  }
}
