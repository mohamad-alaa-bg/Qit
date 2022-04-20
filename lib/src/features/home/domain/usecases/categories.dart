import 'package:dartz/dartz.dart';

import '../../../../core/useCases/usecases.dart';
import '../repositories/home_repo.dart';

class CategoriesUseCase extends UseCases<List<String>, CategoriesParam> {
  final HomeRepo homeRepo;
  CategoriesUseCase({required this.homeRepo});

  @override
  Future<Either<Fail, List<String>>> call(params) async {
    return await homeRepo.getCategories();
  }
}

class CategoriesParam {
  CategoriesParam();
}
