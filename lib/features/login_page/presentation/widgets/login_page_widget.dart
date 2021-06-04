import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/login_page/presentation/bloc/bloc.dart';
import 'package:perfect_app/features/login_page/presentation/bloc/login_user_bloc.dart';
import 'package:perfect_app/features/login_page/presentation/widgets/widgets.dart';
import 'package:perfect_app/features/profile_page/profile_page.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            pageName("Login."),
            loginInputDetails(
              context,
              emailcontroler,
              passwordcontroler,
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              width: 200.0,
              child: MaterialButton(
                color: Colors.white,
                textColor: const Color(0xFF009245),
                elevation: 5.0,
                height: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () async {
                  dispatchConcrete(
                    emailcontroler,
                    passwordcontroler,
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'R',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispatchConcrete(TextEditingController emailcontroler,
      TextEditingController passwordcontroler) {
    BlocProvider.of<LoginUserBloc>(context).add(LoginUserButtonPressedEvent(
      email: emailcontroler.text,
      password: passwordcontroler.text,
    ));
  }
}
