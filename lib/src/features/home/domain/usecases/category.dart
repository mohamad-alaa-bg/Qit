import 'package:dartz/dartz.dart';
import 'package:qit/src/core/usecases/usecases.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';

import '../repositories/home_repo.dart';

class CategoryUseCases extends UseCases<List<ProductModel>, CategoryParam> {
  final HomeRepo homeRepo;

  CategoryUseCases({required this.homeRepo});

  @override
  Future<Either<Fail, List<ProductModel>>> call(params) async {
    return homeRepo.getProducts(params.categoryName);
  }
}

class CategoryParam {
  final String categoryName;

  CategoryParam({required this.categoryName});
}
