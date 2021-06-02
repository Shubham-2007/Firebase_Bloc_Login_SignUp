import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfect_app/page_design/home_page/homePage.dart';
export 'package:perfect_app/page_design/widget.dart';
export 'package:perfect_app/page_design/home_page/homePage.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:perfect_app/blocs/regBloc/user_reg_bloc.dart';
export 'package:perfect_app/blocs/regBloc/user_reg_event.dart';
export 'package:perfect_app/blocs/regBloc/user_reg_state.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:perfect_app/blocs/loginBloc/login_bloc.dart';
export 'package:perfect_app/blocs/loginBloc/login_event.dart';
export 'package:perfect_app/blocs/loginBloc/login_state.dart';

void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return Home(
      user: user,
    );
  }));
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

// Login Details UI Code

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

// Signup Details UI Code

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

      //onChanged: (input) => email = input,
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
      //onChanged: (input) => password = input,
    ),
  );
}
