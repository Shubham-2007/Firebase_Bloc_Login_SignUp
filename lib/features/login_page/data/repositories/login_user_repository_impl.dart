import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:perfect_app/features/login_page/data/datasources/login_user_auth.dart';
import 'package:perfect_app/features/login_page/domain/entities/login_user.dart';
import 'package:perfect_app/features/login_page/domain/repositories/login_user_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class LoginUserRepositoryImpl implements GetLoginUserRepository {
  final LoginUserAuth remoteDataSource;
  final NetworkInfo networkInfo;

  LoginUserRepositoryImpl({
    @required this.remoteDataSource,
      @required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginUser>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final loginUserData =
            await remoteDataSource.loginUserauth(email, password);

        return Right(loginUserData);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
