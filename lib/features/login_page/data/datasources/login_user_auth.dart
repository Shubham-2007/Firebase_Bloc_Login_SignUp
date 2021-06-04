import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfect_app/features/login_page/data/models/login_user_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class LoginUserAuth {
  /// Throws a [ServerException] for all error codes.
  Future<LoginUserModel> loginUserauth(String email, String password);
}

class LoginUserAuthImpl implements LoginUserAuth {
  FirebaseAuth firebaseAuth;
  //FirebaseUser abc;
  LoginUserAuthImpl() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<LoginUserModel> loginUserauth(String email, String password) =>
      loginUserformFirebase(email, password);

  @override
  Future<LoginUserModel> loginUserformFirebase(
      String email, String password) async {
    print("1");
    try {
      var resutls = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
  
      print(resutls.user);
      return LoginUserModel(firebaseUser: resutls.user);
    } catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print("Shubham");
      }
    }
  }
}
