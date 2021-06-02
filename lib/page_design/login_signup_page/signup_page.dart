import 'package:perfect_app/page_design/login_signup_page/widget.dart';

class SignUpPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegBloc(),
      child: SignupPage(),
    );
  }
}

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  UserRegBloc userRegBloc;

  @override
  Widget build(BuildContext context) {
    final bottom =
        MediaQuery.of(context).viewInsets.bottom; //to make scroll bar up
    userRegBloc = BlocProvider.of<UserRegBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false, //to make scroll bar up
      resizeToAvoidBottomPadding: false, //to make scroll bar up
      backgroundColor: const Color(0xFF8CC63F),
      body: SingleChildScrollView(
        reverse: true, //to make scroll bar up
        child: Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: bottom),
            child: Column(
              children: <Widget>[
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
                      userRegBloc.add(SignUpButtonPressedEvent(
                        email: emailcontroler.text,
                        password: passwordcontroler.text,
                      ));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20.0, fontFamily: 'R'),
                    ),
                  ),
                ),
                BlocListener<UserRegBloc, UserRegState>(
                  listener: (context, state) {
                    if (state is UserRegSuccessful) {
                      navigateToHomeScreen(context, state.user);
                    }
                  },
                  child: BlocBuilder<UserRegBloc, UserRegState>(
                    // ignore: missing_return
                    builder: (context, state) {
                      if (state is UserRegInitial) {
                        return signUpbuildInitialUi();
                      } else if (state is UserRegLoading) {
                        return buildLoadingUi("SignIn.....");
                      } else if (state is UserRegSuccessful) {
                        return Container();
                      } else if (state is UserRegFailure) {
                        return signUpbuildFailureUi(state.message);
                      }
                    },
                  ),
                ),
              ],
            )),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
