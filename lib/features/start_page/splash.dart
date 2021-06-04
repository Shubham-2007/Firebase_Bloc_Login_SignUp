import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("SplashPage");
    return Center(
      child: Text(
        "Splash Screen",
        style: TextStyle(decoration: TextDecoration.none),
      ),
    );
  }
}
