import 'package:bloc/bloc.dart';
import 'package:perfect_app/blocs/loginBloc/login_event.dart';
import 'package:perfect_app/blocs/loginBloc/login_state.dart';
import 'package:perfect_app/repositories/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc() {
    this.userRepository = UserRepository();
  }

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is LoginButtonPressedEvent) {
        yield LoginloadingState();
        var user =
            await userRepository.signInUsser(event.email, event.password);
        yield LoginSuccessState(user: user);
      }
    } catch (e) {
      yield LoginFailureState(message: e.toString());
    }
  }
}
