import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/profile_page/homeBloc/home_page_bloc.dart';
import 'package:perfect_app/features/profile_page/homeBloc/home_page_event.dart';
import 'package:perfect_app/features/profile_page/homeBloc/home_page_state.dart';
import 'package:perfect_app/features/start_page/entry_page.dart';

class ProfilePageParent extends StatelessWidget {
  
  FirebaseUser user;
  ProfilePageParent({@required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: ProfilePage(user: user),
    );
  }
}

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  FirebaseUser user;
  HomePageBloc homePageBloc;
  ProfilePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Profile Page");
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'R',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.deepOrangeAccent[10],
                        BlendMode.color,
                      ),
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/id.png')),
                ),
              ),
            ),
            SizedBox(height: 50),
            details(context, "Name", user.uid),
            details(context, "Email", user.email),
            details(context, "Phone No.", user.phoneNumber),
            details(context, "Age", user.displayName),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              height: 45.0,
              minWidth: 300.0,
              elevation: 10.0,
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                'Log out',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                homePageBloc.add(LogOutButtonPressedEvent());
              },
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Entrypage()));
  }

  Widget details(BuildContext context, var field, var fieldname) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 5),
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  field,
                  style: TextStyle(fontSize: 20, fontFamily: 'R'),
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Container(
                child: Text(
                  fieldname.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'R',
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 10,
      ),
    );
  }
}
