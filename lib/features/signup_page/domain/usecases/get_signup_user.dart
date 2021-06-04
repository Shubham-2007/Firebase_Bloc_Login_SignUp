import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/signup_User.dart';
import '../repositories/signup_user_repository.dart';

class GetSignupUser implements UseCase<SignupUser, Params> {
  final GetSignupUserRepository repository;

  GetSignupUser(this.repository);

  @override
  Future<Either<Failure, SignupUser>> call(Params params) async {
    return await repository.signupUser(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => null;
}
