import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:perfect_app/features/login_page/domain/entities/login_user.dart';

class LoginUserModel extends LoginUser {
  FirebaseUser firebaseUser;

  LoginUserModel({
    @required this.firebaseUser,
  });
}
