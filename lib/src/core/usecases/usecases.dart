

import 'package:dartz/dartz.dart';

abstract class UseCases<Type,Params>{
  Future<Either<Fail,Type>> call(Params params);
}