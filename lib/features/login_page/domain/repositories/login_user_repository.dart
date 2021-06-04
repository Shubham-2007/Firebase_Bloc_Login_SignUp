import 'package:dartz/dartz.dart';
import 'package:perfect_app/features/login_page/domain/entities/login_user.dart';
import '../../../../core/error/failures.dart';

abstract class GetLoginUserRepository {
  Future<Either<Failure, LoginUser>> loginUser(String email, String password);
}
