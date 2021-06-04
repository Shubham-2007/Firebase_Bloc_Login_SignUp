import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/signup_User.dart';

abstract class GetSignupUserRepository {
  Future<Either<Failure, SignupUser>> signupUser(String email, String password);
}
