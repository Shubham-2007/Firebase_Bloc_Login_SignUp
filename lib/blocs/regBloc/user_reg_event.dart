import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class UserRegEvent extends Equatable {}

// ignore: must_be_immutable
class SignUpButtonPressedEvent extends UserRegEvent {
  String email, password;
  SignUpButtonPressedEvent({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => null;
}
