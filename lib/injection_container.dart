import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:perfect_app/features/login_page/data/datasources/login_user_auth.dart';
import 'package:perfect_app/features/login_page/data/repositories/login_user_repository_impl.dart';
import 'package:perfect_app/features/login_page/domain/repositories/login_user_repository.dart';
import 'package:perfect_app/features/login_page/domain/usecases/get_login_user.dart';
import 'package:perfect_app/features/signup_page/data/datasources/signup_user_auth.dart';
import 'package:perfect_app/features/signup_page/data/repositories/signup_user_repository_impl.dart';
import 'package:perfect_app/features/signup_page/domain/repositories/signup_user_repository.dart';
import 'package:perfect_app/features/signup_page/domain/usecases/get_signup_user.dart';
import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/login_page/presentation/bloc/bloc.dart';
import 'features/signup_page/presentation/bloc/bloc.dart';

final sl = GetIt.instance;
final s2 = GetIt.instance;

Future<void> init() async {
//! Signup User Object
  // Bloc
  sl.registerFactory(
    () => SignupUserBloc(
      concrete: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSignupUser(sl()));

  // Repository
  sl.registerLazySingleton<GetSignupUserRepository>(
    () => SignupUserRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  ); 

  // Data sources
  sl.registerLazySingleton<SignupUserAuth>(
    () => SignupUserAuthImpl(),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

//! Login User Object
  s2.registerFactory(
    () => LoginUserBloc(
      concrete: s2(),
    ),
  );

  // Use cases
  s2.registerLazySingleton(() => GetLoginUser(s2()));

  // Repository
  s2.registerLazySingleton<GetLoginUserRepository>(
    () => LoginUserRepositoryImpl(
      networkInfo: s2(),
      remoteDataSource: s2(),
    ),
  );

  // Data sources
  s2.registerLazySingleton<LoginUserAuth>(
    () => LoginUserAuthImpl(),
  );
}
