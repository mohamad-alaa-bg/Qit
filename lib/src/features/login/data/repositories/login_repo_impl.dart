import 'package:dartz/dartz.dart';
import 'package:qit/src/features/login/data/datasources/remote_data_sources.dart';
import 'package:qit/src/features/login/data/models/user_model.dart';
import 'package:qit/src/features/login/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSources loginRemoteDataSources;

  LoginRepoImpl({required this.loginRemoteDataSources});

  @override
  Future<Either<Fail, UserModel>> login(String email, String password) async {
    try {
      final userModel = await loginRemoteDataSources.login(email, password);
      if(userModel != null){
        return Right(userModel);

      }else{
        return Left(Fail([]));

      }
    } catch (error) {
      return Left(Fail(error));
    }
  }
}
