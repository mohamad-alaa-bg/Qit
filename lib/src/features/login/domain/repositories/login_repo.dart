import 'package:dartz/dartz.dart';
import 'package:qit/src/features/login/data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Fail,UserModel>> login(String email, String password);
}
