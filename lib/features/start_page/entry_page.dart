import 'package:flutter/material.dart';
import 'package:perfect_app/features/login_page/presentation/pages/login_user_page.dart';
import 'package:perfect_app/features/signup_page/presentation/pages/signup_user_page.dart';

class Entrypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Option PAge");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFF8CC63F),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image(image: AssetImage('assets/drawer.png')),
                  )),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 200.0,
                child: MaterialButton(
                  color: Colors.white,
                  textColor: const Color(0xFF009245),
                  elevation: 5.0,
                  height: 50.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPageParent();
                    }));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0, fontFamily: 'R'),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 200.0,
                child: MaterialButton(
                  color: Colors.white,
                  textColor: const Color(0xFF009245),
                  elevation: 5.0,
                  height: 50.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignupPageParent();
                    }));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20.0, fontFamily: 'R'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
