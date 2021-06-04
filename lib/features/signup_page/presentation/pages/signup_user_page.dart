import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/profile_page/home_page.dart';
import 'package:perfect_app/features/signup_page/presentation/bloc/bloc.dart';
import 'package:perfect_app/features/signup_page/presentation/widgets/signup_user_page.dart';
import 'package:perfect_app/features/signup_page/presentation/widgets/widgets.dart';
import '../../../../injection_container.dart';

class SignupPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignupUserBloc>(),
      child: SignupPage(),
    );
  }
}

class SignupPage extends StatelessWidget {
  const SignupPage({
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
            SignupPageWidget(),
            BlocListener<SignupUserBloc, SignupUserState>(
              listener: (context, state) {
                if (state is SignupUserSuccessful) {
                  navigateToHomeScreen(context, state.user);
                }
              },
              child: BlocBuilder<SignupUserBloc, SignupUserState>(
                builder: (context, state) {
                  if (state is SignupUserInitial) {
                    return signUpbuildInitialUi();
                  } else if (state is SignupUserLoading) {
                    return signupbuildLoadingUi(context);
                  } else if (state is SignupUserSuccessful) {
                    return Container();
                  } else if (state is SignupUserFailure) {
                    return signUpbuildFailureUi(state.message);
                  }
                },
              ),
            )
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
