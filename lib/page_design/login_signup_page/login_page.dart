import 'package:perfect_app/page_design/login_signup_page/widget.dart';

class LoginPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginPage(),
    );
  }
}

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xFF8CC63F),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            
            bottom: bottom,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                pageName("Login."),
                loginInputDetails(
                  context,
                  emailcontroler,
                  passwordcontroler,
                ), //Email,password Inputfield
                
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
                      loginBloc.add(
                        LoginButtonPressedEvent(
                          email: emailcontroler.text,
                          password: passwordcontroler.text,
                        ),
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
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      navigateToHomeScreen(
                        context,
                        state.user,
                      );
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    // ignore: missing_return
                    builder: (context, state) {
                      if (state is LoginInitialState) {
                        return loginbuildInitialUi();
                      } else if (state is LoginloadingState) {
                        return buildLoadingUi("LogIn.....");
                      } else if (state is LoginFailureState) {
                        return loginbuildFailureUi(state.message);
                      } else if (state is LoginSuccessState) {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
