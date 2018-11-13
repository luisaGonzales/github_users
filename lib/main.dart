import 'package:flutter/material.dart';
import 'package:github_users/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Users',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: routes,
    );
  }
}
