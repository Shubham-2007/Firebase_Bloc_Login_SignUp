import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class SignupUserState extends Equatable {}

class SignupUserInitial extends SignupUserState {
  @override
  List<Object> get props => null;
}

class SignupUserLoading extends SignupUserState {
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class SignupUserSuccessful extends SignupUserState {

  FirebaseUser user;

  // ignore: invalid_required_positional_param
  SignupUserSuccessful(@required this.user);

  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class SignupUserFailure extends SignupUserState {

  String message;

  // ignore: invalid_required_positional_param
  SignupUserFailure(@required this.message);

  @override
  List<Object> get props => null;
}