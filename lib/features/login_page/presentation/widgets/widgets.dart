export 'Login_page_loading_widget.dart';
export 'Login_page_widget.dart';
import 'package:flutter/material.dart';

Widget loginInputDetails(
    BuildContext context,
    TextEditingController emailcontroler,
    TextEditingController passwordcontroler) {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: Column(
      children: <Widget>[
        loginEmailDetails(context, "Email", emailcontroler),
        loginPasswordDetails(context, "Password", passwordcontroler),
      ],
    ),
  );
}

Widget loginEmailDetails(BuildContext context, var fieldvalue,
    TextEditingController emailcontroler) {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: const Color(0xFF8CC63F)))),
    child: TextFormField(
      controller: emailcontroler,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle:
              TextStyle(color: Colors.grey.withOpacity(.8), fontFamily: 'R'),
          hintText: fieldvalue),
    ),
  );
}

Widget loginPasswordDetails(BuildContext context, var fieldvalue,
    TextEditingController passwordcontroler) {
  return Container(
    decoration: BoxDecoration(),
    child: TextFormField(
      controller: passwordcontroler,
      obscureText: false,
      // keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          // suffixIcon: IconButton(
          //     icon: Icon(
          //       Icons.remove_red_eye,
          //       color: const Color(0xFF009245),
          //     ),
          //     onPressed: () {
          //       _toggle();
          //       print(_obscureText);
          //     }),
          border: InputBorder.none,
          hintStyle:
              TextStyle(color: Colors.grey.withOpacity(.8), fontFamily: 'R'),
          hintText: "Password"),
    ),
  );
}

Widget loginbuildInitialUi() {
  print("LoginPage");
  return Container();
}

Widget loginbuildLoadingUi(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
    ),
  );
}

Widget loginbuildFailureUi(String message) {
  print("Fail $message");
  return Container();
}

Widget pageName(String pagename) {
  return Container(
    padding: EdgeInsets.only(top: 200, bottom: 100),
    child: Text(
      pagename,
      style: TextStyle(
          fontSize: 50.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'R'),
    ),
  );
}
