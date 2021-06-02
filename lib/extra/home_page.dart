import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:perfect_app/blocs/homeBloc/home_page_bloc.dart';
import 'package:perfect_app/blocs/homeBloc/home_page_event.dart';
import 'package:perfect_app/blocs/homeBloc/home_page_state.dart';
import 'package:perfect_app/page_design/start_page/entry_page.dart';
import 'package:perfect_app/page_design/login_signup_page/signup_page.dart';

class HomePageParent extends StatelessWidget {
  FirebaseUser user;

  HomePageParent({@required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: HomePage(user: user),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  FirebaseUser user;
  HomePageBloc homePageBloc;
  HomePage({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    // ignore: missing_required_param
    return WillPopScope(
      //onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text("email"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                homePageBloc.add(LogOutButtonPressedEvent());
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(user.email),
            ),
            BlocListener<HomePageBloc, HomePageState>(
              listener: (context, state) {
                if (state is LogOutSuccess) {
                  navigateToSignUpPage(context);
                }
              },
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is LogOutInitial) {
                    return Container();
                  } else if (state is LogOutSuccess) {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignUpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return null; //Entrypage();
    }));
  }
}
