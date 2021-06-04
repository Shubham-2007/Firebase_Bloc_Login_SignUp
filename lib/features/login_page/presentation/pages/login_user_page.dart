import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/login_page/presentation/bloc/bloc.dart';
import 'package:perfect_app/features/login_page/presentation/widgets/widgets.dart';
import 'package:perfect_app/features/profile_page/home_Page.dart';
import '../../../../injection_container.dart';

class LoginPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print("Login Page");
    return BlocProvider(
      create: (_) => s2<LoginUserBloc>(),
      child: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false, //to make scroll bar up
      resizeToAvoidBottomPadding: false, //to make scroll bar up
      backgroundColor: const Color(0xFF8CC63F),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          bottom: bottom,
        ),
        child: Column(
          children: <Widget>[
            LoginPageWidget(),
            BlocListener<LoginUserBloc, LoginUserState>(
              listener: (context, state) {
                if (state is LoginUserSuccessState) {
                  return navigateToHomeScreen(context, state.user);
                }
              },
              child: BlocBuilder<LoginUserBloc, LoginUserState>(
                builder: (context, state) {
                  if (state is LoginUserInitialState) {
                    return loginbuildInitialUi();
                  } else if (state is LoginUserloadingState) {
                    return loginbuildLoadingUi(context);
                  } else if (state is LoginUserSuccessState) {
                    return Container(); //HomePage(user: state.user);
                  } else if (state is LoginUserFailureState) {
                    return loginbuildFailureUi(state.message);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
  }
}
