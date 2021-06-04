import 'package:dartz/dartz.dart';
import 'package:perfect_app/features/login_page/domain/entities/login_user.dart';
import 'package:perfect_app/features/login_page/domain/repositories/login_user_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetLoginUser implements UseCase<LoginUser, Params> {
  final GetLoginUserRepository repository;

  GetLoginUser(this.repository);

  @override
  Future<Either<Failure, LoginUser>> call(Params params) async {
    return await repository.loginUser(params.email, params.password);
  }
}
