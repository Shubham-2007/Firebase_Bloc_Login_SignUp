import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class SignupUserEvent extends Equatable {}

// ignore: must_be_immutable
class SignupUserButtonPressedEvent extends SignupUserEvent {
  String email, password;
  SignupUserButtonPressedEvent({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => null;
}
