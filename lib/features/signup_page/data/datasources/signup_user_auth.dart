import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/exceptions.dart';
import '../models/signup_User_model.dart';

abstract class SignupUserAuth {
  /// Throws a [ServerException] for all error codes.
  Future<SignupUserModel> createUserauth(String email, String password);
}

class SignupUserAuthImpl implements SignupUserAuth {
  FirebaseAuth firebaseAuth;
  //FirebaseUser abc;
  SignupUserAuthImpl() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<SignupUserModel> createUserauth(String email, String password) =>
      createuserformfirebase(email, password);

  @override
  Future<SignupUserModel> createuserformfirebase(
      String email, String password) async {
    try {
      var resutls = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return SignupUserModel(firebaseUser: resutls.user);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
