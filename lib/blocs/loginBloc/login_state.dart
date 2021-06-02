import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => null;
}


class LoginloadingState extends LoginState {
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class LoginSuccessState extends LoginState {
  FirebaseUser user;

  LoginSuccessState({@required this.user});
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class LoginFailureState extends LoginState {
  String message;

  LoginFailureState({@required this.message});
  @override
  List<Object> get props => null;
}
