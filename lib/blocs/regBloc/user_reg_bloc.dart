import 'package:bloc/bloc.dart';
import 'user_reg_state.dart';
import 'user_reg_event.dart';
import 'package:perfect_app/repositories/user_repository.dart';

class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRepository userRepository;

  UserRegBloc() {
    this.userRepository = UserRepository();
  }

  @override

  UserRegState get initialState => UserRegInitial();

  @override
  Stream<UserRegState> mapEventToState(UserRegEvent event) async* {
    if (event is SignUpButtonPressedEvent) {
      yield UserRegLoading();
      try {
        var user = await userRepository.createuser(
            event.email, event.password);
        print("BLoC : ${user.email}");
        yield UserRegSuccessful(user);
      } catch (e) {
        yield UserRegFailure(e.toString());
      }
    }
  }
}