import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("/search");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image(
          image: new AssetImage('assets/github-icon.png'),
          height: 140.0,
        ),
      ),
    );
  }
}

