import 'package:dartz/dartz.dart';
import 'package:qit/src/core/usecases/usecases.dart';
import 'package:qit/src/features/login/data/models/user_model.dart';
import 'package:qit/src/features/login/domain/repositories/login_repo.dart';

class LoginUseCase extends UseCases<UserModel, LoginParams> {
  final LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});
  @override
  Future<Either<Fail, UserModel>> call(params) async{

    return await loginRepo.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
