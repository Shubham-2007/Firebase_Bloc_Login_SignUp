import 'package:flutter/material.dart';

Widget buildLoadingUi(String pagename) {
  return Container(
    padding: EdgeInsets.all(16),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
    ),
  );
}

Widget signUpbuildInitialUi() {
  print("SignUpPage");
  return Container();
}

Widget signUpbuildFailureUi(String message) {
  print("Fail $message");
  return Container();
}

Widget loginbuildInitialUi() {
  print("LoginPage");
  return Container();
}

Widget loginbuildFailureUi(String message) {
  print("Fail $message");
  return Container();
}
