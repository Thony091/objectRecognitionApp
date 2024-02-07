import 'package:flutter/material.dart';

class MySplashPage extends StatefulWidget {
  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
