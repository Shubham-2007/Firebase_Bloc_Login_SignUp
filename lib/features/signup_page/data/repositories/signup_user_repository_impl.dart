import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/signup_User.dart';
import '../../domain/repositories/signup_user_repository.dart';
import '../datasources/signup_user_auth.dart';

class SignupUserRepositoryImpl implements GetSignupUserRepository {
  final SignupUserAuth remoteDataSource;

  final NetworkInfo networkInfo;

  SignupUserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, SignupUser>> signupUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
            await remoteDataSource.createUserauth(email, password);

        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
