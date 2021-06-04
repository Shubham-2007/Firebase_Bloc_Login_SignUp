import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class LoginUserEvent extends Equatable {}

// ignore: must_be_immutable
class LoginUserButtonPressedEvent extends LoginUserEvent {
  String email, password;

  LoginUserButtonPressedEvent({
    @required this.email,
    @required this.password,
  });
  @override
  List<Object> get props => null;
}
