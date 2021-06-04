import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class AuthenticatedState extends AuthState {
  FirebaseUser user;

  AuthenticatedState(
    // ignore: invalid_required_positional_param
    @required this.user,
  );

  @override
  List<Object> get props => null;
}

class UnauthenticatedState extends AuthState {
  @override
  List<Object> get props => null;
}
