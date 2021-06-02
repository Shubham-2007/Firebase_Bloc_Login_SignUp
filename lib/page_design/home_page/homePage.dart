import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfect_app/page_design/home_page/profile_page.dart';

class Home extends StatelessWidget {
  FirebaseUser user;

//  String uid;
  Home({//@required this.uid
      @required this.user,
      });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(200)),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Colors.deepOrangeAccent[10],
                                BlendMode.color,
                              ),
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/drawer.png')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Give Feedback',
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.bug_report,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Report Buug',
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.developer_mode,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Developers',
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 280.0,
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.copyright, color: Colors.black, size: 20),
                    title: Text(
                      '2020 Pandavas',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: Text('Phonspital'),
          leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  //navigateToHomePage(context, uid);
                  navigateToHomePage(context, user);
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Homecard(
                image: 'assets/11.png',
                onPressed: () {},
                title: 'Nearby Hospital',
              ),
              Homecard(
                image: 'assets/12.png',
                onPressed: () {},
                title: 'Nearby pharmacy',
              ),
              Homecard(
                image: 'assets/13.png',
                onPressed: () {},
                title: 'Webinars',
              ),
              Homecard(
                image: 'assets/14.png',
                onPressed: () {},
                title: 'Medical Diagnosis',
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHomePage(BuildContext context, /*String*/FirebaseUser user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProfilePageParent(
        //uid: user,
        user: user,
      );
      // ProfilePageParent(
      //   user: user,
      // );
    }));
  }
}

class Homecard extends StatefulWidget {
  final image;
  final onPressed;
  final title;

  const Homecard({Key key, this.image, this.onPressed, this.title})
      : super(key: key);
  @override
  _HomecardState createState() => _HomecardState();
}

class _HomecardState extends State<Homecard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 70.0, top: 20.0),
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.image)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 3.0, color: Colors.green),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.22,
            top: MediaQuery.of(context).size.height * 0.39,
            child: GestureDetector(
              onTap: widget.onPressed,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.55,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
