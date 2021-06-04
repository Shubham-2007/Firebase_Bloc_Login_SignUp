import 'dart:math';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/login_page/domain/usecases/get_login_user.dart';
import 'package:perfect_app/features/login_page/presentation/bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../../../../core/usecases/usecase.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  final GetLoginUser getConcreteNumberTrivia;

  LoginUserBloc({
    @required GetLoginUser concrete,
  })  : assert(concrete != null),
        getConcreteNumberTrivia = concrete;

  @override
  LoginUserState get initialState => LoginUserInitialState();

  @override
  Stream<LoginUserState> mapEventToState(
    LoginUserEvent event,
  ) async* {
    if (event is LoginUserButtonPressedEvent) {
      yield LoginUserloadingState();
      var failureOrTrivia = await getConcreteNumberTrivia(
          Params(email: event.email, password: event.password));
      yield failureOrTrivia.fold(
          (failure) => LoginUserFailureState(message: e.toString()),
          (user) => LoginUserSuccessState(user: user.firebaseUser));
    }
  }
}
