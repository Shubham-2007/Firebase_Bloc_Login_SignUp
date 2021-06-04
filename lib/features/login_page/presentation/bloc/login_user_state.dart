import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class LoginUserState extends Equatable {}

class LoginUserInitialState extends LoginUserState {
  @override
  List<Object> get props => null;
}

class LoginUserloadingState extends LoginUserState {
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class LoginUserSuccessState extends LoginUserState {
  FirebaseUser user;

  LoginUserSuccessState({@required this.user});
  @override
  List<Object> get props => [user];
}

// ignore: must_be_immutable
class LoginUserFailureState extends LoginUserState {
  String message;

  LoginUserFailureState({@required this.message});
  @override
  List<Object> get props => null;
}
