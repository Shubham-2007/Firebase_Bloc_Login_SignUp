import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {}

// ignore: must_be_immutable
class LoginButtonPressedEvent extends LoginEvent {
  String email, password;

  LoginButtonPressedEvent({@required this.email, @required this.password});
  @override
  List<Object> get props => null;
}
