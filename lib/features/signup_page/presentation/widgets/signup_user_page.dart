import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/signup_page/presentation/bloc/bloc.dart';
import 'package:perfect_app/features/signup_page/presentation/widgets/widgets.dart';

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({
    Key key,
  }) : super(key: key);

  @override
  _SignupPageWidgetState createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            pageName("Sign Up."),
            signupInputDetails(
              context,
              emailcontroler,
              passwordcontroler,
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              width: 200.0,
              child: MaterialButton(
                color: Colors.white,
                textColor: Color(0xFF009245),
                elevation: 5.0,
                height: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  dispatchConcrete(
                    emailcontroler,
                    passwordcontroler,
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0, fontFamily: 'R'),
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
    BlocProvider.of<SignupUserBloc>(context).add(SignupUserButtonPressedEvent(
      email: emailcontroler.text,
      password: passwordcontroler.text,
    ));
  }
}
