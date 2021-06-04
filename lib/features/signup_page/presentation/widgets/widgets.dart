export 'loading_widget.dart';
import 'package:flutter/material.dart';

Widget signupInputDetails(
  BuildContext context,
  TextEditingController emailcontroler,
  TextEditingController passwordcontroler,
) {
  return Container(
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      children: <Widget>[
        signupEmailDetails(context, "Email", emailcontroler),
        signupPasswordDetails(context, "Password", passwordcontroler),
      ],
    ),
  );
}

Widget signupEmailDetails(
  BuildContext context,
  var fieldvalue,
  TextEditingController emailcontroler,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Color(0xFF009245))),
    ),
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: emailcontroler,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(.8),
          fontFamily: 'R',
        ),
        hintText: fieldvalue,
      ),
    ),
  );
}

Widget signupPasswordDetails(
  BuildContext context,
  var fieldvalue,
  TextEditingController passwordcontroler,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xFF009245)),
      ),
    ),
    child: TextFormField(
      controller: passwordcontroler,
      obscureText: false,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: Color(0xFF009245),
            ),
            onPressed: () {},
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(.8),
            fontFamily: 'R',
          ),
          hintText: fieldvalue),
    ),
  );
}

Widget signUpbuildInitialUi() {
  print("SignUpPage");
  return Container();
}

Widget signupbuildLoadingUi(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
    ),
  );
}

Widget signUpbuildFailureUi(String message) {
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
