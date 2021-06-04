import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfect_app/features/profile_page/homeBloc/home_page_event.dart';
import 'package:perfect_app/features/profile_page/homeBloc/home_page_state.dart';
import 'package:perfect_app/repositories/user_repository.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  UserRepository userRepository;
  FirebaseAuth firebaseAuth;
  HomePageBloc() {
    this.userRepository = UserRepository();
  }

  @override
  HomePageState get initialState => LogOutInitial();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LogOutButtonPressedEvent) {
      print("LOG out Bloc");
      await userRepository.signOut();
      yield LogOutSuccess();
    }
  }
}
