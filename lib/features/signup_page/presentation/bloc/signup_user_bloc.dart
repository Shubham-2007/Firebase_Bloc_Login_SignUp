import 'dart:math';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_app/features/signup_page/domain/usecases/get_signup_user.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:perfect_app/features/signup_page/presentation/bloc/signup_user_event.dart';
import 'package:perfect_app/features/signup_page/presentation/bloc/signup_user_state.dart';

class SignupUserBloc extends Bloc<SignupUserEvent, SignupUserState> {
  final GetSignupUser getConcreteNumberTrivia;

  SignupUserBloc({
    @required GetSignupUser concrete,
  })  : assert(concrete != null),
        getConcreteNumberTrivia = concrete;

  @override
  SignupUserState get initialState => SignupUserInitial();

  @override
  Stream<SignupUserState> mapEventToState(
    SignupUserEvent event,
  ) async* {
    if (event is SignupUserButtonPressedEvent) {
      yield SignupUserLoading();
      var failureOrTrivia = await getConcreteNumberTrivia(
          Params(email: event.email, password: event.password));
      yield failureOrTrivia.fold((failure) => SignupUserFailure(e.toString()),
          (user) => SignupUserSuccessful(user.firebaseUser));
    }
  }
}
