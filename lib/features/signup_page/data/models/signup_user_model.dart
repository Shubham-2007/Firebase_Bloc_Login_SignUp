import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:perfect_app/features/signup_page/domain/entities/signup_User.dart';

class SignupUserModel extends SignupUser {
  FirebaseUser firebaseUser;
  SignupUserModel({
    @required this.firebaseUser,
  });
}
