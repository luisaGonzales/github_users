import 'package:flutter/material.dart';
import 'package:github_users/screens/search_screen.dart';
import 'package:github_users/screens/splash_screen.dart';

final routes = {
  '/' : (BuildContext context) => new SplashScreen(),
  '/search': (BuildContext context) => new SearchScreen(),
};