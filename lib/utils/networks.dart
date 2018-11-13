import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';

//Set client
final Client customClient = Client(
    endPoint: 'https://api.github.com/graphql',
    cache: InMemoryCache(),
    apiToken: '<GITHUB_PERSONAL_ACCESS_TOKEN>'
);

Future<dynamic> getData(
    String body, {
      Map<String, dynamic> variables,
    }) async {

  final Future<Map<String, dynamic>> result = customClient.query(query: body, variables: variables);
  return result;
}