import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class UserRegState extends Equatable {}

class UserRegInitial extends UserRegState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class UserRegLoading extends UserRegState {
  @override
  List<Object> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class UserRegSuccessful extends UserRegState {

  FirebaseUser user;

  // ignore: invalid_required_positional_param
  UserRegSuccessful(@required this.user);

  @override
  List<Object> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class UserRegFailure extends UserRegState {

  String message;

  // ignore: invalid_required_positional_param
  UserRegFailure(@required this.message);

  @override
  List<Object> get props => throw UnimplementedError();
}