import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class LoginUser extends Equatable {
  FirebaseUser firebaseUser;
  LoginUser({
    @required this.firebaseUser,
  });

  @override
  List<Object> get props => [firebaseUser];
}
