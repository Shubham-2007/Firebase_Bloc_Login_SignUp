import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/blocs/authBloc/auth_event.dart';
import 'package:perfect_app/blocs/authBloc/auth_state.dart';
//import 'package:perfect_app/features/registration_trivia/presentation/pages/number_trivia_page.dart';
import 'package:perfect_app/page_design/start_page/entry_page.dart';
//import 'package:perfect_app/page_design/home_page.dart';
import 'package:perfect_app/page_design/start_page/splash.dart';
//import 'package:perfect_app/page_design/home_page.dart';
import 'package:perfect_app/page_design/home_page/homePage.dart';
import 'blocs/authBloc/auth_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
        child: App(),
      ), //Entrypage(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is AuthInitialState) {
          return SplashPage();
        } else if (state is AuthenticatedState) {
          return
              // Home(
              //   uid: state.user.email,
              // );
              Home(
            user: state.user,
          );
          // HomePageParent(
          //   user: state.user,
          // );
        } else if (state is UnauthenticatedState) {
          return Entrypage(); //NumberTriviaPage();
        }
      },
    );
  }
}
