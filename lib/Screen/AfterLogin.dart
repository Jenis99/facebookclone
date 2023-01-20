import 'package:flutter/material.dart';

class AfterLogin extends StatefulWidget {
  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You are Successfully Log in!!!"),
      ),
    );
  }
}
